import 'package:flutter/material.dart';

class Homelarge extends StatelessWidget {
  const Homelarge({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              child: Center(child: Text('왼쪽')),
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
