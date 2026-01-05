import 'package:flutter/material.dart';
import 'package:flutter05_instagram/controller/controller.dart';
import 'package:get/get.dart';

class MyPage extends StatelessWidget {
  MyPage({super.key});

  final FollowController followController = Get.put(FollowController());
  final imageController = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('john kim'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(radius: 10, backgroundColor: Colors.amber),

              /// 👇 팔로워 수 반응형
              Obx(
                () => Text(
                  '팔로워 ${followController.followerCount}명',
                  style: const TextStyle(fontSize: 30),
                ),
              ),

              ElevatedButton(
                onPressed: followController.follow,
                child: Obx(
                  () => Text(
                    followController.isFollowing.value ? '팔로워 취소하기' : '팔로워 하기',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          /// 🔹 아래 영역 (Expanded)
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: imageController.toggleImage,
                child: const Text('버튼'),
              ),
            ),
          ),

          /// 🔹 버튼 누르면 나타나는 이미지
          Obx(() {
            return imageController.showImage.value
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Image.asset(
                      'src/뉴스모아원본', // ✅ ../ 절대 쓰지 마
                      width: 200,
                    ),
                  )
                : const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
