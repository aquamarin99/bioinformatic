import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class TCardCountericon extends StatelessWidget {
  const TCardCountericon({
    super.key,
    required this.onPressed,
    this.iconColor = Colors.white,
    this.backgroundColor = TColors.black,
  });

  final VoidCallback onPressed;
  final Color iconColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.workspace_premium,
              color: iconColor,
            )),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: backgroundColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: iconColor, fontSizeFactor: 0.8),
              ),
            ),
          ),
        )
      ],
    );
  }
}
