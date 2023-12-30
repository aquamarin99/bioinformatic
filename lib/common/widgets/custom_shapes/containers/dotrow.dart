import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/myapp/controllers/home_carousel_controller.dart';
import 'package:t_store/utils/constants/colors.dart';

class DotSystem extends StatelessWidget {
  const DotSystem({
    super.key,
    required this.banners,
    required this.controller,
  });

  final List<String> banners;
  final dynamic controller; // Controller'ı dynamic olarak tanımla
  final double ratioMargin = 0.02;
  final double ratioPadding = 0.01;

  @override
  Widget build(BuildContext context) {
    final widthTforPC = MediaQuery.of(context).size.width;
    return Obx(
      () => Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: widthTforPC * ratioMargin),
          padding: EdgeInsets.symmetric(horizontal: widthTforPC * ratioPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < banners.length; i++)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    height: 4,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(400),
                      color: _getCurrentColor(i),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getCurrentColor(int index) {
    // Controller türüne göre duruma bağlı renk seçimi
    if (controller is HomeCarouselController1) {
      return (controller as HomeCarouselController1)
                  .carousalCurrentIndex
                  .value ==
              index
          ? TColors.primary
          : TColors.grey;
    } else if (controller is HomeCarouselController2) {
      return (controller as HomeCarouselController2)
                  .carousalCurrentIndex
                  .value ==
              index
          ? TColors.primary
          : TColors.grey;
      // Başka bir controller türü için gerekirse buraya da ekleme yapabilirsiniz.
      // Örneğin: (controller as YourOtherControllerType).someOtherOperation()
      // ve renk seçimi logic'i burada olabilir.
    }

    // Varsayılan renk
    return TColors.grey;
  }
}
