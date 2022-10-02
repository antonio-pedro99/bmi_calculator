import 'package:bmi_calculator/providers/person.dart';
import 'package:bmi_calculator/view/customs/composition_tile.dart';
import 'package:bmi_calculator/view/customs/custom_button.dart';
import 'package:bmi_calculator/view/pages/home.dart';
import 'package:bmi_calculator/view/theme/colors.dart';
import 'package:bmi_calculator/view/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var person = Provider.of<PersonProvider>(context, listen: true).getPerson;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your ",
                style: TextStyle(color: Colors.white.withOpacity(.5)),
              ),
              const Text("Results",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal)),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.help),
              tooltip: "Get Help",
            )
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 240,
                  width: 240,
                  decoration: decoratedBoxGradient,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "BMI",
                        style: CustomTypography.titleMedium,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        person.bodyMassIndex!.toStringAsFixed(2),
                        style: CustomTypography.bodyLarge,
                      ),
                      Text(
                        "Normal",
                        style: CustomTypography.bodyMedium,
                      )
                    ],
                  ),
                ),
                Text(
                  "Body Composition ",
                  style: TextStyle(color: Colors.white.withOpacity(.5)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(width: 150, height: 120, color: darkBlue),
                    CompositionTile(
                      value: "${person.age}",
                      title: "Age",
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CompositionTile(
                      value: "${person.height}",
                      title: "Centimeter",
                    ),
                    CompositionTile(
                      value: "${person.weight}",
                      title: "Kg",
                    )
                  ],
                ),
                CurvedButton(
                  text: "Retry",
                  icon: Icons.restore,
                  onPressed: () {
                    Provider.of<PersonProvider>(context, listen: false)
                        .resetValues();

                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                      builder: (context) {
                        return const MyHomePage();
                      },
                    ), ((route) => false));
                  },
                )
              ],
            ),
          ),
        ));
  }
}
