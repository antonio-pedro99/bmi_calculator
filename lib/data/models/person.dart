import 'package:objectbox/objectbox.dart';

@Entity()
class Person {
  int id = 0;
  int? height;
  int? age;
  int? weight;
  String? name;
  String? gender;
  double? bodyMassIndex;

  @Property(type: PropertyType.date)
  DateTime? dataCreated;

  Person() {
    age = 18;
    bodyMassIndex = 0;
    height = 160;

    weight = 62;
    gender = "Male";
  }
}
