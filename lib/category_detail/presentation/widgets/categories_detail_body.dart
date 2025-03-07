import 'package:chef_staff/category_detail/data/model/recipe_model.dart';
import 'package:chef_staff/category_detail/presentation/widgets/recipes_item.dart';
import 'package:chef_staff/core/sizes.dart';
import 'package:flutter/material.dart';

class CategoriesDetailBody extends StatelessWidget {
  const CategoriesDetailBody({
    super.key,
    required this.recipes,
  });

  final List<RecipeModel> recipes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 169 / 226,
          mainAxisSpacing: 10,
        ),
        itemCount: recipes.length,
        padding: EdgeInsets.fromLTRB(AppSizes.padding38, 10, AppSizes.padding38, 100),
        itemBuilder: (context, index)=> RecipesItem(recipe: recipes[index]));
  }
}
