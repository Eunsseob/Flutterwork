import 'package:flutter/material.dart';
import './style.dart' as style;
import 'package:get/get.dart';

/*
  탭 만들기(Tab widget있지만 나중에 커스터마이징을 하려면 알아야됨)
  1. state에 tab의 현재상태 저장
  2. state에 따라 tab이 어떻게 보일지 작성
  3. 유저가 쉽게 state 조작할 수 있게 조작 가능
*/
void main() {
  runApp(GetMaterialApp(theme: style.theme, home: MyApp()));
}

// Get X 기반 컨트롤러 class
class TabControllerX extends GetxController {
  var tab = 0.obs;

  void changeTab(int index) {
    tab.value = index;
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final TabControllerX controller = Get.put(TabControllerX());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Instagram'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.add_box_outlined)),
          ],
        ),
        body: [Text('Home Page'), Text('Shop Page')][controller.tab.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.tab.value,
          onTap: controller.changeTab,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
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
      ),
    );
  }
}
