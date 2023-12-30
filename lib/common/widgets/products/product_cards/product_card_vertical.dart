import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/shadows.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    /// Container with side paddings, color, edges, radius and shadow
    return Container(
      width: 180, // Must be High for bioinformatic App
      padding: const EdgeInsets.all(1), // This won't be changed
      decoration: BoxDecoration(
          boxShadow: [
            TShadowStyle.verticalProductShadow
          ], // resim yanındaki halkalırın sebebi
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white),
      child: Column(children: [
        /// Thumbnail, WishList Buttoni, Discount Tag,
        TRoundedContainer(
          height: 180, // Must be High for bioinformatic App
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: dark ? TColors.dark : TColors.light,
          child: Stack(children: [
            ///Thumbnail Image,
            const TRoundedImage(
              imageUrl: TImages.productImage1,
              applyImageRadius: true,
            ),

            /// --Sale Tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity((0.8)),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '%25',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            )
          ]),
        )

        /// --Details
      ]),
    );
  }
}
