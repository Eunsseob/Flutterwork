import 'package:flutter/material.dart';

/*
* input 데이터 사용
  TextField()위젯은 저장되지 않음. 변수에 저장해야됨
 */
void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var name = ['이기쁨', '채규태', '이고잉'];

  addName(inputName) {
    setState(() {
      name.add(inputName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(context);
          showDialog(
            context: context,
            builder: (context) {
              return CustomDialog(addName: addName);
            },
          );
        },
        child: Text(''),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xfff3edf7),
        leading: Icon(Icons.list),
        title: Text('주소록'),
        actions: [Icon(Icons.search), Icon(Icons.share)],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: name.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset('assets/user${index + 1}.png'),
            title: Text(name[index]),
          );
        },
      ),
      bottomNavigationBar: CustomBottom(),
    );
  }
}

class CustomDialog extends StatelessWidget {
  CustomDialog({super.key, this.addName});
  final addName;

  // 2.4 input 데이터를 저장할 변수
  var inputData = '';

  // 5. onChanged를 이용하여 변수에 저장하기
  var inputData2 = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(
              onChanged: (text) {
                inputData = text;
              },
            ),
            TextButton(
              onPressed: () {
                addName(inputData);
                Navigator.pop(context);
              },
              child: Text('완료'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('취소'),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.phone),
          Icon(Icons.article_outlined),
          Icon(Icons.contacts),
        ],
      ),
    );
  }
}
