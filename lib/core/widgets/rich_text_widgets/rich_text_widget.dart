import 'package:flutter/material.dart';
import 'package:test_weather/constants/app_colors.dart';
import 'package:test_weather/core/utils/context_utils.dart';

class RichTextWidget extends StatelessWidget {
  final String text;
  final String boldText;
  const RichTextWidget({
    required this.text,
    required this.boldText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: "$text "),
          TextSpan(
            text: boldText,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
