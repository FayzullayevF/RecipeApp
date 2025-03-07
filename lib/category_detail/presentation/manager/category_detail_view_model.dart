import 'package:chef_staff/categories/data/models/categories_model.dart';
import 'package:chef_staff/categories/data/repositories/categories_repository.dart';
import 'package:chef_staff/category_detail/data/model/recipe_model.dart';
import 'package:chef_staff/category_detail/data/repositories/recipe_repository.dart';
import 'package:flutter/material.dart';

class CategoryDetailViewModel with ChangeNotifier {
  CategoryDetailViewModel(
      {required CategoriesRepository catRepo,
      required RecipeRepository recipeRepo})
      : _catRepo = catRepo,
        _recipeRepo = recipeRepo;
  final CategoriesRepository _catRepo;
  final RecipeRepository _recipeRepo;

  List<CategoriesModel> categories = [];
  List<RecipeModel> recipes = [];

  CategoriesModel? selected;

  Future<void> load()async{
    categories = await _catRepo.fetchCategories();
    recipes = await _recipeRepo.fetchRecipeByCategory(selected == null ? 1 : selected!.id);
    notifyListeners();
  }

}
