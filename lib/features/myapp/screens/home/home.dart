import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/features/myapp/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/myapp/screens/home/widgets/home_categories.dart';
import 'package:t_store/features/myapp/screens/home/widgets/home_heading.dart';
import 'package:t_store/features/myapp/screens/home/widgets/homo_promo_slider_forpc.dart';
import 'package:t_store/features/myapp/screens/home/widgets/homo_promo_slider_forphone.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final double maxWidth = THelperFunctions.screenWidth();

  final int categoriesNumber = 4;
  final String title1 = 'Bioengineering News';
  final String title2 = 'TÜBİTAK Announcements';
  final String title3 = 'WHO Announcements';
  final String title4 = 'YTÜ Announcements';
  final List<String> banners1 = getBannerUrlS1();
  final List<String> banners2 = getBannerUrlS2();
  final List<String> banners3 = getBannerUrlS3();
  final List<String> banners4 = getBannerUrlS4();

  @override
  Widget build(BuildContext context) {
    // For Dot position in intialize

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- Appbar ---
                  const THomeAppBar(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  /// -- Searchbar ---
                  TSearchContainer(
                    text: 'Search Organisms',
                  ),

                  const SizedBox(
                    height: TSizes.defaultSpace,
                  ),

                  /// /// -- Caregories/Articles ---
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        ///-- Headingr
                        THomeHeading(),
                        SizedBox(
                          height: TSizes.defaultSpace,
                        ),

                        ///-- Categories,
                        THomeCategories(titles: [
                          "Bioinformatics",
                          "Biomaterial",
                          "Genetic Engineering",
                          "Genetic",
                          "Geneticasdasd"
                        ], images: [
                          TImages.bioinformaticsIcon,
                          TImages.materialscienceIcon,
                          TImages.tissueengineeringIcon,
                          TImages.bioinformaticsIcon,
                          TImages.tissueengineeringIcon,
                        ]),
                      ],
                    ),
                  )
                ],
              ),
            ),

            /// --Body
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace, left: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Promo Slider,

                  maxWidth < 600.0
                      ? HomePhoneSliders(
                          title1: title1,
                          title2: title2,
                          title3: title3,
                          title4: title4,
                          banners1: banners1,
                          banners2: banners2,
                          banners3: banners3,
                          banners4: banners4,
                        )
                      : HomePcSliders(
                          title1: title1,
                          title2: title2,
                          title3: title3,
                          title4: title4,
                          banners1: banners1,
                          banners2: banners2,
                          banners3: banners3,
                          banners4: banners4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Banner UrlSleri ve başlıkları tanımlayan metotlar
/// PromoSlayder1
List<String> getBannerUrlS1() {
  return [
    TImages.promoBanner1,
    TImages.promoBanner2,
    TImages.promoBanner3,
  ];
}

/// PromoSlayder2
List<String> getBannerUrlS2() {
  return [
    TImages.productImage10,
    TImages.productImage1,
  ];
}

/// PromoSlayder3
List<String> getBannerUrlS3() {
  return [
    TImages.productImage11,
    TImages.productImage12,
  ];
}

/// PromoSlayder4
List<String> getBannerUrlS4() {
  return [
    TImages.productImage13,
    TImages.productImage14,
    TImages.productImage15,
    TImages.productImage16,
  ];
}
