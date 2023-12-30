import 'package:flutter/material.dart';

class TConstrainedWidth extends StatelessWidget {
  final double maxWidth;
  final dynamic aligment;
  final Widget child;

  const TConstrainedWidth({
    super.key,
    required this.maxWidth,
    required this.child,
    this.aligment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: aligment,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width > maxWidth
              ? maxWidth
              : MediaQuery.of(context).size.width,
        ),
        child: child,
      ),
    );
  }
}
