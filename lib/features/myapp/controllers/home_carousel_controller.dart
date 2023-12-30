import 'package:get/get.dart';

class HomeCarouselController1 extends GetxController {
  static HomeCarouselController1 get instance => Get.find();
  final carousalCurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }
}

class HomeCarouselController2 extends HomeCarouselController1 {
  // HomeCarouselController1'den türetiliyor, aynı özelliklere sahip
}

class HomeCarouselController3 extends HomeCarouselController1 {
  // HomeCarouselController1'den türetiliyor, aynı özelliklere sahip
}

class HomeCarouselController4 extends HomeCarouselController1 {
  // HomeCarouselController1'den türetiliyor, aynı özelliklere sahip
}
