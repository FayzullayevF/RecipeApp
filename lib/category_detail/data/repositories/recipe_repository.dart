
import 'package:chef_staff/category_detail/data/model/recipe_model.dart';
import 'package:chef_staff/core/client.dart';
import '../../../recipe_detail/data/model/recipe_detail_model.dart';

class RecipeRepository {
  RecipeRepository({required this.client});

  final ApiClient client;
  RecipeDetailModel? recipe;
  Map<int, List<RecipeModel>> recipesByCategory = {};

  Future<List<RecipeModel>> fetchRecipeByCategory(int categoryId)async{
    if(recipesByCategory.containsKey(categoryId) && recipesByCategory[categoryId] != null){
      return recipesByCategory[categoryId]!;
    }
    var rawRecipe = await client.fetchRecipesByCategory(categoryId);
    final recipes = rawRecipe.map((recipe)=> RecipeModel.fromJson(recipe)).toList();
    recipesByCategory[categoryId] = recipes;
    return recipes;
  }

  Future<RecipeDetailModel> fetchRecipesById(int recipeId)async{
    final rawRecipe = await client.fetchRecipeById(recipeId);
    recipe = RecipeDetailModel.fromJson(rawRecipe);
    return recipe!;
  }
}