class Person {
  int? height;
  int? age;
  int? weight;
  String? name;
  String? gender;
  double? bodyMassIndex;

  Person(
      {this.age = 18,
      this.bodyMassIndex = 0,
      this.height,
      this.name,
      this.weight = 70,
      this.gender});
}
