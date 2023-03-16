import 'package:bmi_calculator/view/theme/colors.dart';
import 'package:bmi_calculator/view/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChatVisorButton extends StatelessWidget {
  const ChatVisorButton({
    super.key,
    required this.bmi,
    required this.head,
    required this.status,
    this.onTap,
  });

  final String bmi;
  final String status;
  final String head;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Container(
        height: 240,
        width: 240,
        decoration: decoratedBoxGradient,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              head,
              style: CustomTypography.titleMedium,
            ),
            const SizedBox(height: 15),
            Text(
              bmi,
              style: CustomTypography.bodyLarge,
            ),
            Text(
              status,
              style: CustomTypography.bodyMedium,
            ),
            const SizedBox(height: 24),
            Text(
              "(Tap for Feedback)",
              style: CustomTypography.bodySmall.copyWith(color: Colors.yellow),
            )
          ],
        ),
      ),
    );
  }
}
