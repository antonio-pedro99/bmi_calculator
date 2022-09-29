import 'package:flutter/cupertino.dart';

class CustomPentagon extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    Path path0 = Path();

    path0.moveTo(size.width * 0.0750000, size.height * 0.1225000);
    path0.cubicTo(
        size.width * 0.1593750,
        size.height * 0.0237500,
        size.width * 0.8468750,
        size.height * 0.0237500,
        size.width * 0.9150000,
        size.height * 0.1275000);
    path0.cubicTo(
        size.width,
        size.height * 0.1750000,
        size.width * 0.8225000,
        size.height * 0.9668750,
        size.width * 0.7500000,
        size.height * 0.9700000);
    path0.cubicTo(
        size.width * 0.5631250,
        size.height * 0.9700000,
        size.width * 0.4393750,
        size.height * 0.9700000,
        size.width * 0.2525000,
        size.height * 0.9700000);
    path0.cubicTo(
        size.width * 0.1918750,
        size.height * 0.9681250,
        size.width * -0.0062500,
        size.height * 0.1825000,
        size.width * 0.0750000,
        size.height * 0.1225000);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
