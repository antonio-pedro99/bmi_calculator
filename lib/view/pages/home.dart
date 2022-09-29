import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/view/customs/age_picker.dart';
import 'package:bmi_calculator/view/customs/gender_selection_tile.dart';
import 'package:bmi_calculator/view/customs/weight_picker.dart';
import 'package:bmi_calculator/view/pages/height.dart';
import 'package:flutter/material.dart';

import '../customs/custom_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<int> ages = List<int>.generate(80, (index) => index);

    return Scaffold(
      appBar: AppBar(
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
                  image: "male.gif",
                  color: blue,
                ),
                GenderSelectionTale(
                  gender: "Female",
                  image: "female.gif",
                  color: pink,
                )
              ],
            ),
            const SizedBox(height: 25),
            const SizedBox(height: 100, child: AgePicker()),
            const SizedBox(height: 24),
            const WeightPicker(),
            const SizedBox(height: 24),
            CurvedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: ((context) {
                  return HeightPage();
                })));
              },
            ),
          ],
        ),
      ),
    );
  }
}
