import 'package:bmi_calculator/providers/person.dart';
import 'package:bmi_calculator/view/customs/age_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgePicker extends StatefulWidget {
  const AgePicker({Key? key}) : super(key: key);

  @override
  State<AgePicker> createState() => _AgePickerState();
}

class _AgePickerState extends State<AgePicker> {
  late PageController agePickerController;
  int _selectedAge = 18;
  @override
  void initState() {
    super.initState();

    agePickerController =
        PageController(initialPage: _selectedAge, viewportFraction: .14);

    agePickerController.addListener(() {
      setState(() {
        int position = agePickerController.page!.round();
        if (position != _selectedAge) {
          _selectedAge = position;

          //Age of the Person
          trackAndSetPersonAge(context);
        }
      });
    });
  }

  void trackAndSetPersonAge(BuildContext context) {
    Provider.of<PersonProvider>(context, listen: false)
        .setPersonAge(_selectedAge);
  }

  @override
  void dispose() {
    agePickerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: agePickerController,
      scrollDirection: Axis.horizontal,
      itemCount: 80,
      itemBuilder: (context, index) {
        bool isActive = _selectedAge == index;
        bool isNextLeftClose = index - _selectedAge == -1;
        bool isNextRightClose = index - _selectedAge == 1;
        bool isNextNextLeftClose = index - _selectedAge == -2;
        bool isNextNextRightClose = index - _selectedAge == 2;
        var text = Text("$index");
        return Align(
          alignment: Alignment.center,
          child: isActive
              ? AgeIndicator(
                  age: index,
                )
              : Text(
                  "${text.data}",
                  style: TextStyle(
                      color: Colors.white
                          .withOpacity(isNextLeftClose || isNextRightClose
                              ? .8
                              : isNextNextLeftClose || isNextNextRightClose
                                  ? .5
                                  : .3),
                      fontSize: isNextLeftClose || isNextRightClose
                          ? 24
                          : isNextNextLeftClose || isNextNextRightClose
                              ? 16
                              : 14),
                ),
        );
      },
    );
  }
}
