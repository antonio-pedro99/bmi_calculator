import 'package:bmi_calculator/view/customs/age_picker.dart';
import 'package:bmi_calculator/view/customs/gender_selection_tile.dart';
import 'package:flutter/material.dart';

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
    //var agePicker = AgePicker();
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
            const SizedBox(height: 100, child: AgePicker()),
          ],
        ),
      ),
    );
  }
}
