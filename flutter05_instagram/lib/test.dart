import 'package:flutter/material.dart';
import 'package:flutter05_instagram/view/mypage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter Demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyPage(),
    );
  }
}
