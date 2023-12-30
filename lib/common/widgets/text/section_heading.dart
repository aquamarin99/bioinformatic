import 'package:flutter/material.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TSectionHeading extends StatelessWidget {
  TSectionHeading({
    super.key,
    required this.title,
    this.buttonTitle = 'View all',
    this.showActionButton = true,
    this.textColor,
    this.onPressed,
    MainAxisAlignment? mainAxisAlignment,
  }) : _mainAxisAlignment = mainAxisAlignment ??
            (THelperFunctions.screenWidth() > 500
                ? MainAxisAlignment.center
                : MainAxisAlignment.start);

  final String title, buttonTitle;
  final bool showActionButton;
  final Color? textColor;
  final void Function()? onPressed;
  final MainAxisAlignment _mainAxisAlignment;

  MainAxisAlignment get mainAxisAlignment => _mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: _mainAxisAlignment, //MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        if (showActionButton)
          TextButton(onPressed: () {}, child: Text(buttonTitle)),
      ],
    );
  }
}
