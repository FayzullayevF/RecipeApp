import 'package:chef_staff/category_detail/data/model/recipe_model.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeTime extends StatelessWidget {
  const RecipeTime({
    super.key,
    required this.timeRequired,
  });

  final int timeRequired;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Text(
          "${timeRequired.toString()}min",
          style: TextStyle(
            color: AppColors.pinkSubColor,
            fontSize: 12,
          ),
        ),
        SvgPicture.asset("assets/icons/clock.svg")
      ],
    );
  }
}
