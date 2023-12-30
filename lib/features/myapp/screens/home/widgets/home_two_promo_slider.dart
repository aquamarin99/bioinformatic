import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/dotrow.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TPromoSliderforPC extends StatelessWidget {
  const TPromoSliderforPC({
    super.key,
    required this.banners1, //Left Promoslider
    required this.banners2, //Right Promoslider
    this.controller, //Left Controller
    this.controller2,

    ///Right Controller
  });

  /// Afiş Listesi
  final List<String> banners1;
  final List<String> banners2;
  final dynamic controller;
  final dynamic controller2;

  @override
  Widget build(BuildContext context) {
    // Dot position in changable screen Sizes
    //final controller = Get.put(HomeCarouselController1());
    //final controller2 = Get.put(HomeCarouselController2());
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          /// HomePage Banners/News
          Row(
            children: [
              Expanded(
                child: CarouselSlider(
                    items: banners1
                        .map((url) => TRoundedImage(imageUrl: url))
                        .toList(),
                    options: CarouselOptions(
                        viewportFraction: 1,
                        onPageChanged: (index, _) =>
                            controller.updatePageIndicator(index))),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CarouselSlider(
                    items: banners2
                        .map((url) => TRoundedImage(imageUrl: url))
                        .toList(),
                    options: CarouselOptions(
                        viewportFraction: 1,
                        onPageChanged: (index, _) =>
                            controller2.updatePageIndicator(index))),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          ///
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Dot Number
              DotSystem(
                banners: banners1,
                controller: controller,
              ),
              const SizedBox(width: 26),

              DotSystem(banners: banners2, controller: controller2)
            ],
          ),
        ],
      ),
    );
  }
}
