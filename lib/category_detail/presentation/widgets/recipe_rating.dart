import 'package:chef_staff/category_detail/presentation/widgets/recipe_svg_image.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';

class RecipeRating extends StatelessWidget {
  const RecipeRating({
    super.key,
    this.textColor = AppColors.pinkSubColor,
    this.iconColor = AppColors.nameColor,
    this.swap = false,
    required this.rating,
  });

  final Color textColor, iconColor;
  final num rating;
  final bool swap;

  @override
  Widget build(BuildContext context) {
    Text text = Text(
      rating.toString(),
      style: TextStyle(
        color: textColor,
        fontSize: 12,
      ),
    );

    RecipeSvgImage image = RecipeSvgImage(
      height: 10,
      image: "assets/icons/star.svg",
      width: 10,
      color: iconColor,
    );
    return Row(
      children: [
        swap ? image : text,
        SizedBox(width: 5,),
        swap ? text : image
      ],
    );
  }
}
