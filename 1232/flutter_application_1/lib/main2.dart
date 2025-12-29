import 'package:flutter/material.dart';

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
          backgroundColor: Color.fromARGB(0, 25, 25, 122),
          leading: Icon(Icons.list),
          title: Text('MyApp'),
          actions: [Icon(Icons.search), Icon(Icons.forward_sharp)],
        ),
        body: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Colors.blue),
          ),
          child: const Center(
            child: Text('본문', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
