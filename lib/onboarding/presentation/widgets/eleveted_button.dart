import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';

class elevatedbutton_widget extends StatelessWidget {
  const elevatedbutton_widget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(
          AppColors.pinkSubColor,
        ),
        backgroundColor: WidgetStateProperty.all(
          AppColors.nameColor,
        ),
        fixedSize: WidgetStateProperty.all(const Size(207, 45)),
      ),
    );
  }
}