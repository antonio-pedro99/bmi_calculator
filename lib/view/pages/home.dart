import 'package:bmi_calculator/controller/data_input_controller.dart';
import 'package:bmi_calculator/view/customs/age_picker.dart';
import 'package:bmi_calculator/view/customs/gender_picker.dart';
import 'package:bmi_calculator/view/customs/weight_picker.dart';
import 'package:bmi_calculator/view/pages/height.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../customs/custom_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
        title: const Text('BMI Calculator'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const GenderPicker(),
            const SizedBox(height: 90, child: AgePicker()),
            const SizedBox(height: 18),
            const WeightPicker(),
            const SizedBox(height: 20),
            CurvedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: ((context) {
                  return const HeightPage();
                })));
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
