import 'package:chef_staff/category_detail/data/model/recipe_model.dart';
import 'package:chef_staff/category_detail/presentation/widgets/recipe_rating.dart';
import 'package:chef_staff/category_detail/presentation/widgets/recipe_time.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeItemInfo extends StatelessWidget {
  const RecipeItemInfo({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 169.w,
      height: 56.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(14)),
        border: Border.all(color: AppColors.pinkSubColor, width: 1),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            recipe.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 129.w,
            child: Text(
              recipe.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
                color: Colors.black,
                height: 1,
              ),
            ),
          ),
          Spacer(),
          Row(
            children: [
              RecipeRating(rating: recipe.rating),
              RecipeTime(time: recipe.time,)
            ],
          )
        ],
      ),
    );
  }
}
