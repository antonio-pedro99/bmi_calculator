import 'package:bmi_calculator/view/customs/age_indicator.dart';
import 'package:bmi_calculator/view/customs/pentagon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constants.dart';

class WeightPicker extends StatefulWidget {
  const WeightPicker({Key? key}) : super(key: key);

  @override
  State<WeightPicker> createState() => _WeightPickerState();
}

class _WeightPickerState extends State<WeightPicker> {
  late PageController weightPickerController;
  int _selectedAge = 18;
  @override
  void initState() {
    super.initState();

    weightPickerController =
        PageController(initialPage: _selectedAge, viewportFraction: .14);

    weightPickerController.addListener(() {
      setState(() {
        int position = weightPickerController.page!.round();
        if (position != _selectedAge) {
          _selectedAge = position;
        }
      });
    });
  }

  @override
  void dispose() {
    weightPickerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ClipPath(
      clipper: CustomPentagon(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.hardEdge,
        child: Container(
          height: size.height * .35,
          width: size.width * .8,
          padding: const EdgeInsets.all(12),
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
              color: primary, borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: 100,
            child: PageView.builder(
              controller: weightPickerController,
              scrollDirection: Axis.horizontal,
              itemCount: 80,
              itemBuilder: (context, index) {
                bool isActive = _selectedAge == index;
                bool isNextLeftClose = index - _selectedAge == -1;
                bool isNextRightClose = index - _selectedAge == 1;
                bool isNextNextLeftClose = index - _selectedAge == -2;
                bool isNextNextRightClose = index - _selectedAge == 2;
                var text = Text("${index + 1}");
                return Align(
                  alignment: Alignment.center,
                  child: Text(
                    "${text.data}",
                    style: TextStyle(
                        color: Colors.white.withOpacity(isActive
                            ? 1
                            : isNextLeftClose || isNextRightClose
                                ? .8
                                : isNextNextLeftClose || isNextNextRightClose
                                    ? .5
                                    : .3),
                        fontSize: isActive
                            ? 34
                            : isNextLeftClose || isNextRightClose
                                ? 24
                                : isNextNextLeftClose || isNextNextRightClose
                                    ? 16
                                    : 14),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
