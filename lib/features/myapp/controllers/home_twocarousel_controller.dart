import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTwoCarouselController extends GetxController {
  static HomeTwoCarouselController get instance => Get.find();

  late BuildContext
      context; // BuildContext değişkenini nullable olarak tanımlıyoruz

  HomeTwoCarouselController(); // Boş yapıcı metod

  late final RxInt pageSizeIndex; // pageSizeIndex'i geç başlatıyoruz

  void initialize(BuildContext context) {
    this.context = context;
    pageSizeIndex = (DeviceUtility.getScreenWidth(context)).toInt().obs;
  }

  void updatePageSize(index) {
    pageSizeIndex.value = index;
  }
}

class DeviceUtility {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
// dinamik takip
/*
final dotpositioncontroller = HomeTwoCarouselController();
    // For Dot position in intialize
    dotpositioncontroller.initialize(context);


                Obx(
                  () => SizedBox(
                      width: (dotpositioncontroller.pageSizeIndex.value
                              .toDouble() /
                          2)),
                ),*/ 