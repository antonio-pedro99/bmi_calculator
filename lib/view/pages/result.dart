import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/view/customs/composition_tile.dart';
import 'package:bmi_calculator/view/customs/custom_button.dart';
import 'package:bmi_calculator/view/pages/home.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                const CircleAvatar(radius: 130, backgroundColor: primary),
                Text(
                  "Body Composition ",
                  style: TextStyle(color: Colors.white.withOpacity(.5)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(width: 150, height: 120, color: darkBlue),
                    CompositionTile(
                      value: 25.toString(),
                      title: "Age",
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CompositionTile(
                      value: 156.toString(),
                      title: "Height",
                    ),
                    CompositionTile(
                      value: 65.toString(),
                      title: "Kg",
                    )
                  ],
                ),
                CurvedButton(
                  text: "Retry",
                  icon: Icons.restore,
                  onPressed: () {
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
