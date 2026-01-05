import 'package:get/state_manager.dart';

class FollowController extends GetxController {
  RxInt followerCount = 0.obs;
  RxBool isFollowing = false.obs;

  void follow() {
    if (isFollowing.value) {
      followerCount--;
    } else {
      followerCount++;
    }
    isFollowing.toggle();
  }
}

class ImageController extends GetxController {
  RxBool showImage = false.obs;

  void toggleImage() {
    showImage.value = !showImage.value;
  }
}
