import 'package:flutter/material.dart';
import './style.dart' as style;

var theme;
void main() {
  runApp(MaterialApp(theme: style.theme, home: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add_box_outlined)),
        ],
      ),
      body: Column(
        children: [
          TextButton(onPressed: () {}, child: Text('Elevate Button')),
          ElevatedButton(onPressed: () {}, child: Text('텍스트버튼아니다')),
        ],
      ),
    );
  }
}
