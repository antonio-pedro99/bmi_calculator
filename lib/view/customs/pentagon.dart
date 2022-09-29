import 'package:flutter/cupertino.dart';

class CustomPentagon extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    Path customPath = Path();

    customPath.moveTo(width * 0.0750000, height * 0.1225000);
    customPath.cubicTo(width * 0.1593750, height * 0.0237500, width * 0.8468750,
        height * 0.0237500, width * 0.9150000, height * 0.1275000);
    customPath.cubicTo(width, height * 0.1750000, width * 0.8225000,
        height * 0.9668750, width * 0.7500000, height * 0.9700000);
    customPath.cubicTo(width * 0.5631250, height * 0.9700000, width * 0.4393750,
        height * 0.9700000, width * 0.2525000, height * 0.9700000);
    customPath.cubicTo(
        width * 0.1918750,
        height * 0.9681250,
        width * -0.0062500,
        height * 0.1825000,
        width * 0.0750000,
        height * 0.1225000);
    customPath.close();
    return customPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
