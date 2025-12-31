import 'package:flutter/material.dart';

/*
  * 스타일을 한 곳에
  ThemeData() : 스타일을 모아 놓음(<style></style> 와 같은 의미)
  - 같은 파일에 넣어도 되고, 별도의 파일로 만들어 넣어도 됨
*/

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.blue),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey,
          actionsIconTheme: IconThemeData(color: Colors.amber),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.red, fontSize: 30),
        ),
      ),
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [Icon(Icons.star)]),
      body: Column(Icon(Icons.star), Text('안냥~~')),
    );
  }
}
