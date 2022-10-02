import 'package:bmi_calculator/data/models/person.dart';
import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';

class PersonProvider extends ChangeNotifier {
  bool isMaleSelected = true;

  Person _person = Person();

  void selectGender() {
    isMaleSelected = !isMaleSelected;
    _person.gender = isMaleSelected ? "Male" : "Female";
    notifyListeners();
  }

  void resetValues() {
    isMaleSelected = true;
    _person = Person();
    notifyListeners();
  }

  void setPersonAge(int age) {
    _person.age = age;
  }

  void setPersonName(String name) {
    _person.name = name;
  }

  void setPersonHeight(int height) {
    _person.height = height;
  }

  void setPersonWeight(int weight) {
    _person.weight = weight;
  }

  void calculatePersonBodyMassIndex() {
    //calculate the BMI

    double height = _person.height! / 100;
    int weight = _person.weight!;

    _person.bodyMassIndex = weight / (height * height);
  }

  String getStatus() {
    var bmi = _person.bodyMassIndex!;
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi < 25) {
      return "Normal";
    } else if (bmi < 30) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  Person get getPerson => _person;
}
