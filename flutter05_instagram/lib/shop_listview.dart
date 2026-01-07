import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/*
- where() 사용법
                사용방법                 |    비교방식
------------------------------------------------------------
isEqualTo: value                        | 같다
isGreaterThan: value                    | 크다
isGreaterThanOrEqualTo: value           | 크거나 같다
isLessThan: value                       | 작다
isLessThanOrEqualTo: value              | 작거나 같다
arrayContains: value(List 항목이어야 됨)  | 포함
arrayContainsAny: [...]                 | 배열 중 하나라도 포함
where('field', whereIn: [...])          | 여러 값 중 하나
where('field', whereNotIn: [...])       | 여러 값 제외
 */
final firestore = FirebaseFirestore.instance;

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  List<String> name = [];
  List<String> city = [];
  List<int> age = [];
  List<List<dynamic>> hobbies = [];
  @override
  void initState() {
    super.initState();
    // setData();
    getData();
    // updateData();
  }

  setData() async {
    var rand = Random();

    // 일괄 쓰기
    WriteBatch batch = firestore.batch();
    var names = [
      '김도환',
      '이민준',
      '박서준',
      '최지우',
      '정유진',
      '한지민',
      '오세훈',
      '강민호',
      '윤서연',
      '신동현',
      '조하늘',
      '백예린',
      '임수빈',
      '차은우',
      '홍지훈',
      '유나린',
      '서준혁',
      '문채원',
      '노태현',
    ];
    var citys = [
      'Seoul',
      'Busan',
      'Incheon',
      'Daegu',
      'Gwangju',
      'Daejeon',
      'Suwon',
      'Sejong',
      'Jeju',
      'Ulsan',
      'Busan',
      'Incheon',
      'Sejong',
      'Daejeon',
      'Suwon',
      'Seoul',
      'Busan',
      'Jeju',
      'Ulsan',
    ];
    var allHobbies = [
      'reading',
      'soccer',
      'music',
      'gaming',
      'traveling',
      'cooking',
      'drawing',
      'hiking',
    ];

    for (var i = 0; i < 19; i++) {
      DocumentReference id = firestore
          .collection('person')
          .doc('person${i + 2}');

      // 취미는 2~4개
      int hobbyCount = rand.nextInt(3) + 2; // 2~4
      var shuffled = List<String>.from(allHobbies)..shuffle();
      var hobbies = shuffled.take(hobbyCount).toList();

      batch.set(id, {
        'name': names[i],
        'age': i + 25,
        'city': citys[i],
        'hobbies': hobbies,
      });
    }
    await batch.commit();
  }

  getData() async {
    var persons = await firestore.collection('person').get();
    print('------------------------------------------------');
    try {
      for (var doc in persons.docs) {
        print('------------------------------------------------');
        name.add(doc['name']);
        age.add(doc['age']);
        city.add(doc['city']);
        hobbies.add(doc['hobbies']);
      }
      print('------------------------------------------------');
    } catch (e) {
      print('서버 오류');
    }
  }

  /*
  * set vs update
    - set은 같은 문서이면 update하고, 문서가 없으면 생성
    - update는 반드시 문서가 있어야 한다. 없으면 오류
   */
  updateData() async {
    await firestore.collection('person').doc('person1').update({
      'hobbies': ['reading', 'traveling'],
    });
    var hobbyUpdate = await firestore.collection('person').doc('person1').get();
    print(hobbyUpdate['hobbies']);
    print('------------------------------------------------');

    // 아래와 같이 하면 name, age, city모두 지워지고 hobbies만 덮어쓰기 됨
    await firestore.collection('person').doc('person1').set({
      'hobbies': ['cooking', 'gaming'],
    });

    // set을 할때는 모든 필드를 다 넣어줘야 함.
    await firestore.collection('person').doc('person1').set({
      'name': '홍길동',
      'age': 20,
      'city': 'Seoul',
      'hobbies': ['cooking', 'gaming'],
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('person')
          .snapshots(), // 👈 핵심
      builder: (context, asyncSnapshot) {
        return ListView.builder(
          itemCount: name.length,
          itemBuilder: (context, index) => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('이름은 ' + name[index]),
                  Text('나이는 ' + age[index].toString()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('도시는 ' + city[index]),
                  Text('취미는 ' + hobbies[index].join(',')),
                ],
              ),
              Divider(),
            ],
          ),
        );
      },
    );
  }
}
