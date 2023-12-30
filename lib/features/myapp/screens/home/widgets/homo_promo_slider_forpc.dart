import 'package:flutter/material.dart';
import 'package:t_store/features/myapp/controllers/home_carousel_controller.dart';
import 'package:t_store/features/myapp/screens/home/widgets/home_promo_slider_title.dart';
import 'package:t_store/features/myapp/screens/home/widgets/home_two_promo_slider.dart';
import 'package:t_store/utils/constants/sizes.dart';

class HomePcSliders extends StatelessWidget {
  const HomePcSliders({
    super.key,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
    required this.banners1,
    required this.banners2,
    required this.banners3,
    required this.banners4,
    this.spaceBtwTitles = 26,
    this.fontSizeFactor = 1.2,
    this.disBtwTitleSlider = 6.0,
  });
  final String title1;
  final String title2;
  final String title3;
  final String title4;
  final List<String> banners1;
  final List<String> banners2;
  final List<String> banners3;
  final List<String> banners4;
  final double spaceBtwTitles;
  final double disBtwTitleSlider;
  final double fontSizeFactor;
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headlineMedium!.apply(
          fontSizeFactor: fontSizeFactor,
        );

    return Column(
      children: [
        /// PromoSlider Titles for first and Second
        Padding(
          padding: const EdgeInsets.only(
              right: TSizes.defaultSpace, left: TSizes.defaultSpace),
          child: Row(
            children: [
              HomePromoSliderTitle(title: title1, style: textStyle),
              SizedBox(width: spaceBtwTitles),
              HomePromoSliderTitle(title: title2, style: textStyle),
            ],
          ),
        ),

        ///TPromoS,liderforPC can take two PromoSilder as Row
        TPromoSliderforPC(
          controller: HomeCarouselController1(),
          banners1: banners1,
          controller2: HomeCarouselController2(),
          banners2: banners2,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// PromoSlider Titles for Third and fourth
        Padding(
          padding: const EdgeInsets.only(
              right: TSizes.defaultSpace, left: TSizes.defaultSpace),
          child: Row(
            children: [
              HomePromoSliderTitle(title: title3, style: textStyle),
              SizedBox(width: spaceBtwTitles),
              HomePromoSliderTitle(title: title4, style: textStyle),
            ],
          ),
        ),
        TPromoSliderforPC(
          controller: HomeCarouselController3(),
          banners1: banners3,
          controller2: HomeCarouselController4(),
          banners2: banners4,
        ),
      ],
    );
  }
}
