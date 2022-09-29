import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AgeIndicator extends StatelessWidget {
  const AgeIndicator({Key? key, required this.age}) : super(key: key);

  final int age;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 60,
            width: 55,
            // alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: primary, borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 5,
                  width: 25,
                  decoration: BoxDecoration(
                      color: darkBlue, borderRadius: BorderRadius.circular(10)),
                ),
                Text(
                  "$age",
                  style: const TextStyle(color: Colors.white, fontSize: 28),
                )
              ],
            )),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Age",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.normal, fontSize: 16),
        )
      ],
    );
  }
}
