import 'package:bmi_calculator/data/models/person.dart';

//att: this might not be a good approach. I did just to make the app more testable
String getStatus(double bmi) {
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

double calculatePersonBodyMassIndex(Person person) {
  double height = person.height! / 100;
  int weight = person.weight!;

  return weight / (height * height);
}
