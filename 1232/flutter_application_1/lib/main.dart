import 'package:flutter/material.dart';

/*
  Widget
  - Material widget과 Cupertino widget
  : 사용하려면 반드시 2개 중 하나를 사용해야 그 안에 있는 디자인을 기반으로 위젯 생성
    (미리 만들어 놓은 위젯들을 가져다 사용함. 컴포넌트가 들어있다 생각하면 됨)
    위젯들이 정상 작동하려면 반드시 넣어야 됨

  1. Material widget : 안드로이드 위젯
  2. Cupertino widget : iPhone 용 위젯
  > flutter에서 안드로이드 폰을 만들어도 Cupertino widget 사용 가능 (서로 교차 사용 가능)

  * 기본적으로 많이 사용하는 widget
    1. Text() : 글씨 넣기 -> Text('글씨')
    2. Image() : 이미지 넣기 -> Image.asset('이미지명')
    3. Icon() : 아이콘 넣기 -> Icon(Icons.??)
    4. Container : 박스 넣기
*/

void main() {
  runApp(const MyApp());
}
/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 앱 시작 시 가장 먼저 보이는 화면
      home: Scaffold(
        appBar: AppBar(
          title: const Text('예제'),
        ),
        body: Container(
          width: 100,
          height: 100,
          color: Colors.amber,
          margin: EdgeInsets.all(20),
          child: Text('본문 박스에 글씨 넣기 내용됨'),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.ice_skating),
              Icon(Icons.eighteen_up_rating),
              Icon(Icons.nineteen_mp),
            ],
          ),
        ),
      ),
    );
  }
}
*/
/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("예제"),
          backgroundColor: Colors.limeAccent,
        ),
        body: Center(
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.blue),
            ),
            child: const Center(
              child: Text(
                '본문',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.ice_skating),
              Icon(Icons.eighteen_up_rating),
              Icon(Icons.nineteen_mp),
            ],
          ),
        ),
      ),
    );
  }
}*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("예제"),
          backgroundColor: Colors.limeAccent,
        ),
        body: SizedBox(
          // child: Text(
          //   '안냥~',
          //   style: TextStyle(
          //     color: Colors.deepPurple,
          //     fontSize: 50,
          //     fontWeight: FontWeight.w900,
          //   ),
          // ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.ac_unit_outlined,
              size: 50,
              color: Colors.lightBlueAccent,
            ),
          ),
        ),
      ),
    );
  }
}
