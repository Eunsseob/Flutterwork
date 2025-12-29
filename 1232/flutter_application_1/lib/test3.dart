import 'package:flutter/material.dart';

/*
* Flexible() 위젯 : flex와 비슷
  : 전체에서 ?% 자리 차지
    - Row(), Column() 에서 사용

*/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xfff3edf7),
          title: Text('강남역'),
          actions: [
            Icon(Icons.search),
            SizedBox(width: 10),
            Icon(Icons.menu),
            SizedBox(width: 10),
            Icon(Icons.notification_add),
            Padding(padding: EdgeInsets.only(right: 16)),
          ], // 오른쪽
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/111.jpg', width: 150),
              SizedBox(width: 30),

              Flexible(
                flex: 5,
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: [
                      Text(
                        '고양이 집사 구함',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text('개냥이, 활발한 성격'),
                      Text(
                        '금액은 만나서 결정',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Icon(Icons.favorite_border), Text('4')],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
