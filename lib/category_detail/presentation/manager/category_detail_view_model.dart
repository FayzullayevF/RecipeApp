import 'package:chef_staff/categories/data/models/categories_model.dart';
import 'package:chef_staff/categories/data/repositories/categories_repository.dart';
import 'package:chef_staff/category_detail/data/model/recipe_model.dart';
import 'package:chef_staff/category_detail/data/repositories/recipe_repository.dart';
import 'package:flutter/material.dart';

class CategoryDetailViewModel with ChangeNotifier {
  CategoryDetailViewModel({
    required CategoriesRepository catRepo,
    required RecipeRepository recipeRepo,
    required CategoriesModel selected,
  })  : _catRepo = catRepo,
        _recipeRepo = recipeRepo,
        _selected = selected;
  final CategoriesRepository _catRepo;
  final RecipeRepository _recipeRepo;

  List<CategoriesModel> categories = [];
  List<RecipeModel> recipes = [];
  bool isLoading = true;

  late CategoriesModel _selected;

  CategoriesModel get selected => _selected;

  set selected(CategoriesModel model) {
    _selected = model;
    notifyListeners();
    fetchRecipesByCategory(_selected.id);
  }

  Future<void> load() async {
    isLoading = true;
    notifyListeners();
    categories = await _catRepo.fetchCategories();
    recipes = await _recipeRepo.fetchRecipeByCategory(selected.id);
    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchRecipesByCategory(int categoryId) async {
    recipes = await _recipeRepo.fetchRecipeByCategory(selected.id);
  }
}
