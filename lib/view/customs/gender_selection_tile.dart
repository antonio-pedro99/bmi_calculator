import 'package:bmi_calculator/view/customs/curve.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class GenderSelectionTale extends StatelessWidget {
  const GenderSelectionTale(
      {Key? key,
      required this.gender,
      required this.image,
      this.color = darkBlue})
      : super(key: key);

  final String gender;
  final String image;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipPath(
            clipper: CustomCurvePath(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: size.height * .14,
                width: size.width * .4,
                decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    color: color,
                    borderRadius: BorderRadius.circular(8)),
                child: Image.asset("assets/$image"),
              ),
            )),
        const SizedBox(
          height: 18,
        ),
        Text(
          gender,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.normal, fontSize: 16),
        )
      ],
    );
  }
}
