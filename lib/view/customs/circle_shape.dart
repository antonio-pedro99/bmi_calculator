import 'package:flutter/cupertino.dart';

class CircleCustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(231.057, 48.922);
    path0.lineTo(280.138, 221.138);
    path0.lineTo(181.975, 221.138);
    path0.lineTo(231.057, 48.922);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
