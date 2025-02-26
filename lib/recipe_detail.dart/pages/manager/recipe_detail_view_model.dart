import 'package:chef_staff/recipe_detail.dart/data/model/recipe_detail_model.dart';
import 'package:chef_staff/recipe_detail.dart/repository/recipe_repository.dart';
import 'package:flutter/material.dart';

class RecipeDetailViewModel extends ChangeNotifier{

  RecipeDetailViewModel({required RecipeDetailRepository repo, required this.recipeId}): _repo = repo{
      load();
  }
  final RecipeDetailRepository _repo;
  bool loading = true;
  final int recipeId;
  late final RecipeDetailModel recipe;

Future<void> load() async{
  loading = true;
  notifyListeners();

  recipe = await _repo.fetchRecipeById(recipeId);
  loading = false;
  notifyListeners();
}

}