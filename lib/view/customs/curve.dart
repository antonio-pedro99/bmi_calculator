import 'package:flutter/material.dart';

class CustomCurvePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    Path customPath = Path();
    customPath.moveTo(0, size.height * 0.0016667);
    customPath.lineTo(size.width * 0.9975000, size.height * 0.0033333);
    customPath.lineTo(size.width * 0.9991667, size.height * 0.9150000);
    customPath.lineTo(size.width * 0.0016667, size.height * 0.9983333);
    customPath.lineTo(0, size.height * 0.0016667);
    customPath.close();
    return customPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
