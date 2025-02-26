import 'package:chef_staff/core/client.dart';
import 'package:chef_staff/recipe_detail.dart/data/model/recipe_detail_model.dart';

class RecipeDetailRepository {
   RecipeDetailRepository({
    required this.client,
  });

  final ApiClient client;
  RecipeDetailModel? recipe;

  Future<RecipeDetailModel> fetchRecipeById(int recipeId) async{
    final rawRecipe = await client.fetchRecipeById(recipeId);
    recipe = RecipeDetailModel.fromJson(rawRecipe);
    return recipe!;
  }
}
