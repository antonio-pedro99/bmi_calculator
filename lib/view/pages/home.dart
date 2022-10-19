import 'package:bmi_calculator/view/customs/age_picker.dart';
import 'package:bmi_calculator/view/customs/gender_picker.dart';
import 'package:bmi_calculator/view/customs/weight_picker.dart';
import 'package:bmi_calculator/view/pages/height.dart';
import 'package:bmi_calculator/view/pages/records.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: const Text('BMI Calculator'),
              forceElevated: innerBoxIsScrolled,
              actions: [
                IconButton(
                    onPressed: (() {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const RecordPage();
                      }));
                    }),
                    icon: const Icon(Icons.history))
              ],
            )
          ];
        },
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const GenderPicker(),
              const SizedBox(height: 90, child: AgePicker()),
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
      ),
    );
  }
}
