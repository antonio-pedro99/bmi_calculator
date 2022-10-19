import 'package:bmi_calculator/data/models/gender.dart';
import 'package:bmi_calculator/view/customs/curve.dart';
import 'package:bmi_calculator/view/theme/colors.dart';
import 'package:bmi_calculator/view/theme/typography.dart';
import 'package:flutter/material.dart';

class GenderSelectionTale extends StatelessWidget {
  const GenderSelectionTale(
      {Key? key, required this.gender, this.onPressed, this.isSelected = false})
      : super(key: key);

  final Gender gender;
  final bool? isSelected;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipPath(
              clipper: CustomCurvePath(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AnimatedContainer(
                  curve: Curves.bounceInOut,
                  duration: const Duration(microseconds: 800),
                  height: isSelected! ? size.height * .16 : size.height * .14,
                  width: isSelected! ? size.width * .45 : size.width * .4,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: isSelected! ? Colors.white : grey),
                      color: gender.color,
                      borderRadius: BorderRadius.circular(8)),
                  child:
                      Stack(alignment: AlignmentDirectional.center, children: [
                    Image.asset("assets/${gender.image}"),
                    isSelected!
                        ? const Positioned(
                            top: 5,
                            right: 5,
                            child: Icon(
                              Icons.check_box_sharp,
                              color: primary,
                            ))
                        : Container()
                  ]),
                ),
              )),
          SizedBox(
            height: size.height * .018,
          ),
          Text(gender.gender!,
              style: isSelected!
                  ? CustomTypography.labelNormalBold
                  : CustomTypography.labelNormal),
        ],
      ),
    );
  }
}
