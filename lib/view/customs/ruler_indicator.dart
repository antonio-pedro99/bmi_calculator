import 'package:flutter/material.dart';

class RulerIndicator extends StatelessWidget {
  const RulerIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 3,
          width: 220,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 25,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(left: 2),
                  color: Colors.white.withOpacity(.5),
                  width: 20,
                );
              }),
        ),
        const Icon(
          Icons.pin_drop_sharp,
          size: 30,
          color: Colors.yellow,
        )
      ],
    );
  }
}
