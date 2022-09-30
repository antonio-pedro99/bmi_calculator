import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  var isMaleSelected = true;
  var isFemaleSelected;
  double? height;
  int? age, weight;
}
