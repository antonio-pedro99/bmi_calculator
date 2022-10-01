import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  var isMaleSelected = true;

  double? _height;
  int? _age, _weight;

  void selectGender() {
    isMaleSelected = !isMaleSelected;
    notifyListeners();
  }

  void resetValues() {
    isMaleSelected = true;
    notifyListeners();
  }
}
