import 'package:chef_staff/category_detail/data/model/recipe_model.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeRating extends StatelessWidget {
  const RecipeRating({
    super.key,
    required this.recipeModel,
  });

  final RecipeModel recipeModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Text(
          recipeModel.rating.toString(),
          style: TextStyle(
            color: AppColors.pinkSubColor,
            fontSize: 12,
          ),
        ),
        SvgPicture.asset("assets/icons/star.svg")
      ],
    );
  }
}
