import 'package:flutter/material.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TCustomCurvedEdge extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final deviceFixes = THelperFunctions.screenHeight();

    ///-------FirstCurve----------///
    final firstCurve = deviceFixes > 760
        ? Offset(0, size.height - 20 * 2)
        : Offset(0, size.height - 20);
    final lastCurve = deviceFixes > 760
        ? Offset(60, size.height - 20 * 2)
        : Offset(30, size.height - 20);
    path.quadraticBezierTo(
        firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    ///-------SecondCurve----------///
    final secondfirstCurve = deviceFixes > 760
        ? Offset(0, size.height - 20 * 2)
        : Offset(0, size.height - 20);
    final secondlastCurve = deviceFixes > 760
        ? Offset(size.width - 30 * 2, size.height - 20 * 2)
        : Offset(size.width - 30, size.height - 20);

    path.quadraticBezierTo(secondfirstCurve.dx, secondfirstCurve.dy,
        secondlastCurve.dx, secondlastCurve.dy);

    ///-------ThirdCurve----------///

    final thirdfirstCurve = deviceFixes > 760
        ? Offset(size.width, size.height - 20 * 2)
        : Offset(size.width, size.height - 20);
    final thirdlastCurve = deviceFixes > 760
        ? Offset(size.width, size.height)
        : Offset(size.width, size.height);

    path.quadraticBezierTo(thirdfirstCurve.dx, thirdfirstCurve.dy,
        thirdlastCurve.dx, thirdlastCurve.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
