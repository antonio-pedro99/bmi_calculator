import 'dart:ffi';

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/view/customs/age_indicator.dart';
import 'package:bmi_calculator/view/customs/curve.dart';
import 'package:bmi_calculator/view/customs/gender_selection_tile.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController agePickerController;
  int _selectedAge = 18;
  @override
  void initState() {
    super.initState();

    agePickerController =
        PageController(initialPage: _selectedAge, viewportFraction: .15);

    agePickerController.addListener(() {
      setState(() {
        _selectedAge = agePickerController.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<int> ages = List<int>.generate(80, (index) => index);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                GenderSelectionTale(
                  gender: "Male",
                ),
                GenderSelectionTale(
                  gender: "Female",
                )
              ],
            ),
            const SizedBox(height: 45),
            SizedBox(
              height: 100,
              child: PageView.builder(
                controller: agePickerController,
                scrollDirection: Axis.horizontal,
                itemCount: 80,
                itemBuilder: (context, index) {
                  return index == _selectedAge
                      ? AgeIndicator(
                          age: index + 1,
                        )
                      : Text(
                          "${index + 1}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
