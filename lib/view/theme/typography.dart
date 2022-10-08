import 'package:flutter/material.dart';

class CustomTypography {
  static TextStyle labelNormal = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.normal, fontSize: 16);

  static TextStyle labelNormalBold = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);

  static TextStyle labelSmall = const TextStyle();
  static TextStyle labelSmallBold = const TextStyle();
  static TextStyle labelLarge = const TextStyle(
      color: Colors.white, fontSize: 34, fontWeight: FontWeight.normal);
  static TextStyle labelLargeBold = const TextStyle();

  static TextStyle bodySmall = const TextStyle();
  static TextStyle bodySmallBold = const TextStyle();
  static TextStyle bodyLarge = const TextStyle(
      color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 48);

  static TextStyle bodyMedium = TextStyle(
      color: Colors.white.withOpacity(.8),
      fontWeight: FontWeight.normal,
      fontSize: 20);
  static TextStyle bodyLargeBold = const TextStyle();

  static TextStyle titleMedium =
      const TextStyle(color: Colors.white, fontSize: 20);
}
