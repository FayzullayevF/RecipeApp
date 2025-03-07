import 'package:chef_staff/category_detail/data/model/recipe_model.dart';
import 'package:chef_staff/category_detail/presentation/widgets/recipe_item_image.dart';
import 'package:chef_staff/category_detail/presentation/widgets/recipe_item_info.dart';
import 'package:chef_staff/core/routing/routes.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';


class RecipesItem extends StatelessWidget {
  const RecipesItem(
      {super.key, required this.recipe, this.goBackRoute = Routes.home});

  final RecipeModel recipe;
  final String goBackRoute;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 169.w,
        height: 226.h,
        child: GestureDetector(
          onTap: ()=> context.go("/categorydetail?from=$goBackRoute", extra: recipe),
          child: RecipeItemStack(
            recipe: recipe,
          ),
        ),
      ),
    );
  }
}

class RecipeItemStack extends StatelessWidget {
  const RecipeItemStack({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: RecipeItemInfo(recipe: recipe),
        ),
        RecipeItemImage(image: recipe.photo),
        Positioned(
            top: 7,
            right: 8,
            child: Container(
              width: 28.w,
              height: 28.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  AppColors.actionContainerColor
              ),
              child: SvgPicture.asset(
                "assets/icons/heart.svg",
                colorFilter: ColorFilter.mode(
                 AppColors.pinkSubColor,
                  BlendMode.srcIn,
                ),
              ),
            ))
      ],
    );
  }
}
