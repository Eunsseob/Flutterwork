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
          Text('더조은 풀스택'),
          Text('flutter', style: Theme.of(context).textTheme.bodyLarge),
          TextButton(onPressed: () {}, child: Text('Elevate Button')),
          ElevatedButton(onPressed: () {}, child: Text('텍스트버튼아니다')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // label의 글씨 안보이게 하려면
        // showSelectedLabels: true,
        // showUnselectedLabels: false,
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
