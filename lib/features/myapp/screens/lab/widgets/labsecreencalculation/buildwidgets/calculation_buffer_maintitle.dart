import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class CreateBufferTitle extends StatelessWidget {
  const CreateBufferTitle({
    super.key,
    required this.title,
    this.textAlign,
    required this.style,
    this.width,
    this.radius = 10,
  });
  final String title;
  final TextAlign? textAlign;
  final TextStyle style;
  final double? width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius)),
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            textAlign: textAlign,
            style: style.apply(color: dark ? TColors.white : TColors.black),
          ),
        ));
  }
}
