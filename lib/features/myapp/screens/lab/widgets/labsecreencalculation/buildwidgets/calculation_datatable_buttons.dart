import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class CalculationDataTableButton extends StatelessWidget {
  CalculationDataTableButton({
    super.key,
    this.buttonFirst = 'Calculate',
    this.buttonSecond = 'Remove All',
    this.fontSize = 18,
    required this.onPressedRemove,
    required this.onPressedCalculate,
  });

  final String buttonFirst;
  final String buttonSecond;
  final double fontSize;
  final Function() onPressedRemove; // Bu satırı güncelledim
  final Function() onPressedCalculate; // Bu satırı güncelledim
  final double maxWidth = 600;

  @override
  Widget build(BuildContext context) {
    final double width = THelperFunctions.screenWidth();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 5, bottom: 16.0, top: 8.0),
            child: SizedBox(
              width: maxWidth > width
                  ? (width * 4 / 10) - 30
                  : (maxWidth * 4 / 10) - 30,
              height: 40,
              child: TextButton(
                onPressed: onPressedCalculate,
                style: TextButton.styleFrom(
                  backgroundColor: TColors.darkerGrey,
                  foregroundColor: Colors.purple,
                  side: const BorderSide(color: Colors.cyan, width: 1.0),
                ),
                child: Text(
                  buttonFirst,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.white,
                  ),
                ),
              ),
            )),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Padding(
            padding: const EdgeInsets.only(right: 5.0, bottom: 16.0, top: 8.0),
            child: SizedBox(
              width: maxWidth > width
                  ? (width * 4 / 10) - 30
                  : (maxWidth * 4 / 10) - 30,
              height: 40,
              child: TextButton(
                onPressed: onPressedRemove,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.purple,
                  side: const BorderSide(color: Colors.cyan, width: 1.0),
                ),
                child: Text(
                  buttonSecond,
                  style: TextStyle(
                      fontSize: fontSize, color: Colors.purple.shade600),
                ),
              ),
            ))
      ],
    );
  }
}
