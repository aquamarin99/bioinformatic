import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class HomePromoSliderTitle extends StatelessWidget {
  const HomePromoSliderTitle({
    super.key,
    required this.title,
    this.style,
  });
  final String title;
  final TextStyle? style;
  final int maxLines = 1;
  final TextAlign textAlign = TextAlign.center;
  final double ratioMargin = 0.02;
  final double ratioPadding = 0.01;

  @override
  Widget build(BuildContext context) {
    final widthTforPc = MediaQuery.of(context).size.width;
    final dark = THelperFunctions.isDarkMode(context);
    final textColor = dark ? TColors.light : TColors.primary;
    //dark ? TColors.primary : Colors.black,
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: widthTforPc * ratioMargin),
        padding: EdgeInsets.symmetric(horizontal: widthTforPc * ratioPadding),
        child: Text(
          title,
          style: style?.copyWith(color: textColor),
          maxLines: maxLines,
          textAlign: textAlign,
        ),
      ),
    );
  }
}
