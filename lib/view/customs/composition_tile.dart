import 'package:bmi_calculator/view/theme/colors.dart';
import 'package:flutter/material.dart';

class CompositionTile extends StatelessWidget {
  const CompositionTile({Key? key, this.title, this.value}) : super(key: key);

  final String? title;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 120,
      color: darkBlue,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value!,
            style: const TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.normal,
                fontSize: 38),
          ),
          Text(
            title!,
            style: TextStyle(color: Colors.white.withOpacity(.8)),
          ),
        ],
      ),
    );
  }
}
