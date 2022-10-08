import 'package:bmi_calculator/data/models/person.dart';
import 'package:bmi_calculator/functions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bmi_calculator/providers/person.dart';

void main() {
  group("Some Unit tests: ", () {
    test("Male should be selected",
        () => expect(PersonProvider().isMaleSelected, true));

    test("Should be Obese", () => expect(getStatus(45), "Obese"));

    test("Status should be Normal", () => expect(getStatus(22.45), "Normal"));

    test(
        "BMI should be Overweight",
        () => expect(
            calculatePersonBodyMassIndex(Person()
              ..height = 160
              ..weight = 70),
            27.343749999999996));
  });
}
