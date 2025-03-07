
import 'package:chef_staff/category_detail/data/model/recipe_model.dart';
import 'package:chef_staff/core/client.dart';

class RecipeRepository {
  RecipeRepository({required this.client});

  final ApiClient client;

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
}