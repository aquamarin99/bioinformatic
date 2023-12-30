import 'package:flutter/material.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TConstrainedAppBarHeight extends StatelessWidget {
  final double maxWidth = THelperFunctions.screenWidth();
  final Widget child;

  TConstrainedAppBarHeight({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height < maxWidth ? 350 : 400,
        child: child);
  }
}
