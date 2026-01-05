import 'package:flutter/material.dart';
import './style.dart' as style;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

/*
* shared preference (localStorage와 비슷)
  : 로컬 저장 공간
  넣을 때 : set자료형('키', '값')
  가져올 때 : get자료형('키')
             get('키')

             자료형을 모를 경우. Object나 dynamic 반환 -> 자료를 형변환해야 할 수도 있음
*/

void main() {
  runApp(MaterialApp(theme: style.theme, home: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;
  var feedItems = [];
  // 이미지 저장공간 만들기
  var userImage;
  var userContent; // 사용자로부터 입력받아서 저장

  saveData() async {
    var storage = await SharedPreferences.getInstance();
    storage.setString('name', 'emmer');
    var result = storage.get('name');
    print(result);

    storage.setBool('bool', true);
    storage.setDouble('dou', 3.1415);
    storage.setStringList('list', ['list1', 'list2']);

    var result2 = storage.get('bool');
    var result3 = storage.get('dou');
    var result4 = storage.getStringList(
      'list',
    )?[1]; // List get만 쓰지말고 .getString을 사용하여야 하며, ? 연산자를 사용하여야함.
    print('bool 출력 : $result2');
    print('dou 출력 : $result3');
    print('list 출력 : $result4');

    storage.remove('dou');
    storage.clear();

    // map 저장
    var map = {'age': 20};
    storage.setString('map1', jsonEncode(map));

    var result6 = storage.get('map');
    print('map1 : $result6');
    // print(jsonDecode(result6)); // Null일수도 있으니
    var result7 = storage.getString('map') ?? '비었음';
    print(jsonDecode(result7)['age']);
  }

  setUserContent(newContent) {
    setState(() {
      userContent = newContent;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    saveData();
  }

  getData() async {
    var result = await http.get(
      Uri.parse('https://itwon.store/flutter/data/data.json'),
    );
    if (result.statusCode == 200) {
      var result2 = jsonDecode(result.body);
      setState(() {
        feedItems = result2;
      });
    } else {
      throw Exception('서버에서 가져오기 실패');
    }
  }

  addData(a) {
    setState(() {
      feedItems.addAll(a);
    });
  }

  addMyData() {
    var myData = {
      "id": 50,
      "image": userImage,
      "likes": 0,
      "date": "Jun 02",
      "content": userContent,
      "liked": false,
      "user": "John Kim",
    };
    setState(() {
      feedItems.insert(0, myData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instargram'),
        actions: [
          IconButton(
            onPressed: () async {
              var picker = ImagePicker();
              var image = await picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                setState(() {
                  userImage = File(image.path);
                });
              }
              // picker.pickImage(source: ImageSource.camera)  // 카메라로 직접 찍기
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Upload(
                    userImage: userImage,
                    setUserContent: setUserContent,
                    addMyData: addMyData,
                  ),
                ),
              );
            },
            icon: Icon(Icons.add_box_outlined),
          ),
        ],
      ),
      body: [
        Home(feedItems: feedItems, addData: addData),
        Text('Shop Page'),
      ][tab],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (i) {
          print(i);
          setState(() {
            tab = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Shop',
          ),
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key, this.feedItems, this.addData});
  final feedItems;
  final addData;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scroll = ScrollController();

  bool isLoading = false;
  bool hasMore = true;
  int page = 1;

  getMore() async {
    if (isLoading || !hasMore) return;

    isLoading = true;
    var result = await http.get(
      Uri.parse('https://itwon.store/flutter/data/data$page.json'),
    );
    if (result.statusCode == 200) {
      var result2 = jsonDecode(result.body);
      if (result2.isEmpty) {
        hasMore = false;
      } else {
        widget.addData(result2);
        page++;
      }
    } else {
      hasMore = false;
      throw Exception('서버에서 가져오기 실패');
    }
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    scroll.addListener(() {
      if (scroll.position.pixels >= scroll.position.maxScrollExtent - 100) {
        getMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.feedItems.isNotEmpty) {
      return ListView.builder(
        itemCount: widget.feedItems.length,
        controller: scroll,
        itemBuilder: (c, i) {
          return Column(
            children: [
              widget.feedItems[i]['image'].runtimeType == String
                  ? Image.network(widget.feedItems[i]['image'])
                  : Image.file(
                      widget.feedItems[i]['image'],
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),

              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('좋아요 : ${widget.feedItems[i]['likes']}'),
                    Text('글쓴이 : ${widget.feedItems[i]['user']}'),
                    Text('내용 : ${widget.feedItems[i]['content']}'),
                  ],
                ),
              ),
            ],
          );
        },
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}

class Upload extends StatelessWidget {
  const Upload({
    super.key,
    this.userImage,
    this.setUserContent,
    this.addMyData,
  });
  final userImage;
  final setUserContent;
  final addMyData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              addMyData();
              Navigator.pop(context);
            },
            icon: Icon(Icons.send),
          ),
        ],
      ),
      body: Column(
        children: [
          Image.file(userImage),
          Text('이미지 업로드 화면'),
          TextField(
            onChanged: (text) {
              setUserContent(text);
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
