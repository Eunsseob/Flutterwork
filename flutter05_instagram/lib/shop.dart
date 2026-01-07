import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// 1. import
import 'package:firebase_auth/firebase_auth.dart';

final firestore = FirebaseFirestore.instance;


class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListView.builder(itemBuilder: product.)
        ],
      ),
    );
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
