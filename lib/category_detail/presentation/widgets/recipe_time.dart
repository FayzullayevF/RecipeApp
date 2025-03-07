import 'package:chef_staff/category_detail/presentation/widgets/recipe_svg_image.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';

class RecipeTime extends StatelessWidget {
  const RecipeTime({
    super.key,
    required this.time,
    this.textColor = AppColors.pinkSubColor,
    this.iconColor = AppColors.pinkSubColor,
  });

  final int time;
  final Color textColor, iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RecipeSvgImage(
          height: 10,
          image: "assets/icons/clock.svg",
          width: 10,
          color: iconColor,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "${time}min",
          style: TextStyle(
            color: textColor,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
