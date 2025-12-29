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
          backgroundColor: Color.fromARGB(0, 245, 2, 164),
          title: Text('강남역'),
          actions: [
            Icon(Icons.search),
            Icon(Icons.table_rows_sharp),
            Icon(Icons.airline_seat_legroom_extra_sharp),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/111.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '짱구는 못말려 극장판',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '홍대입구, 10 분전',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  Text('티켓가격 5,000 원', style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 180,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.heart_broken, color: Colors.red),
                        const SizedBox(width: 5),
                        Text('4'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
