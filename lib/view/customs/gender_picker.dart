import 'package:bmi_calculator/providers/person.dart';
import 'package:bmi_calculator/data/models/gender.dart';
import 'package:bmi_calculator/view/customs/gender_selection_tile.dart';
import 'package:bmi_calculator/view/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenderPicker extends StatefulWidget {
  const GenderPicker({Key? key}) : super(key: key);

  @override
  State<GenderPicker> createState() => _GenderPickerState();
}

class _GenderPickerState extends State<GenderPicker> {
  int selected = 0;

  List<Gender> genders = [
    Gender(
      gender: "Male",
      image: "male.gif",
      color: blue,
    ),
    Gender(
      gender: "Female",
      image: "female.gif",
      color: pink,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .22,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: genders.length,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10);
        },
        itemBuilder: (context, index) {
          int current = index;
          int old = selected;
          return GenderSelectionTale(
            gender: genders[index],
            isSelected: current == selected,
            onPressed: () {
              setState(() {
                selected = current;
                if (old != current) {
                  Provider.of<PersonProvider>(context, listen: false)
                      .selectGender();
                }
                old = current;
              });
            },
          );
        },
      ),
    );
  }
}
