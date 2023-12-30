import 'package:flutter/material.dart';
import 'package:t_store/features/myapp/controllers/home_carousel_controller.dart';
import 'package:t_store/features/myapp/screens/home/widgets/home_promo_slider.dart';
import 'package:t_store/features/myapp/screens/home/widgets/home_promo_slider_title.dart';
import 'package:t_store/utils/constants/sizes.dart';

class HomePhoneSliders extends StatelessWidget {
  const HomePhoneSliders({
    super.key,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
    required this.banners1,
    required this.banners2,
    required this.banners3,
    required this.banners4,
    this.fontSizeFactor = 1.2,
    this.disBtwTitleSlider = 6.0,
  });
  final String title1;
  final String title2;
  final String title3;
  final String title4;
  final double disBtwTitleSlider;
  final double fontSizeFactor;
  final List<String> banners1;
  final List<String> banners2;
  final List<String> banners3;
  final List<String> banners4;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelMedium!.apply(
          fontSizeFactor: fontSizeFactor,
        );
    return Column(
      children: [
        /// First PromoSlider Title
        Padding(
          padding: const EdgeInsets.only(
              right: TSizes.defaultSpace, left: TSizes.defaultSpace),
          child: HomePromoSliderTitle(title: title1, style: textStyle),
        ),

        /// Distance between Title & Promosliders
        SizedBox(
          height: disBtwTitleSlider,
        ),
        // First, PromoSlider
        TPromoSlider(
          banners: banners1,
          controller: HomeCarouselController1(),
        ),

        /// Distance between Two Promosliders
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// Second PromoSlider Title
        Padding(
          padding: const EdgeInsets.only(
              right: TSizes.defaultSpace, left: TSizes.defaultSpace),
          child: HomePromoSliderTitle(title: title2, style: textStyle),
        ),

        /// Distance between Title & Promosliders
        SizedBox(
          height: disBtwTitleSlider,
        ),

        /// Second PromoSlider
        TPromoSlider(
          banners: banners2,
          controller: HomeCarouselController2(),
        ),

        /// Distance between Two Promosliders
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// Third PromoSlider Title
        Padding(
          padding: const EdgeInsets.only(
              right: TSizes.defaultSpace, left: TSizes.defaultSpace),
          child: HomePromoSliderTitle(title: title3, style: textStyle),
        ),

        /// Distance between Title & Promosliders
        SizedBox(
          height: disBtwTitleSlider,
        ),
        // Third PromoSlider
        TPromoSlider(
          banners: banners3,
          controller: HomeCarouselController3(),
        ),

        /// Distance between Two Promosliders
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// Fourth PromoSlider Title
        Padding(
          padding: const EdgeInsets.only(
              right: TSizes.defaultSpace, left: TSizes.defaultSpace),
          child: HomePromoSliderTitle(title: title4, style: textStyle),
        ),

        /// Distance between Title & Promosliders
        SizedBox(
          height: disBtwTitleSlider,
        ),

        /// Fourth PromoSlider
        TPromoSlider(
          banners: banners4,
          controller: HomeCarouselController4(),
        ),
      ],
    );
  }
}
