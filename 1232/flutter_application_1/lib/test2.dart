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
          backgroundColor: Color.fromARGB(0, 245, 2, 164),
          title: Text('강남역'),
          actions: [
            Icon(Icons.search),
            Icon(Icons.table_rows_sharp),
            Icon(Icons.airline_seat_legroom_extra_sharp),
          ],
        ),

        body: Column(
          children: [
            // Flexible(child: Container(color: Colors.blueGrey), flex: 3),
            // Flexible(child: Container(color: Colors.lightBlue), flex: 7),
            // Flexible(child: Container(color: Colors.lime), flex: 5),
            // Flexible(child: Container(color: Colors.black), flex: 5),
            Expanded(child: Container(color: Colors.lightBlue)),
            Container(width: 100, color: Colors.amber),

            
          ],
        ),
      ),
    );
  }
}
