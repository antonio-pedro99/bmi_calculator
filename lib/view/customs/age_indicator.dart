import 'package:bmi_calculator/view/theme/colors.dart';
import 'package:bmi_calculator/view/theme/typography.dart';
import 'package:flutter/material.dart';

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
                  style: CustomTypography.labelLarge,
                )
              ],
            )),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Age",
          style: CustomTypography.labelNormal,
        )
      ],
    );
  }
}
