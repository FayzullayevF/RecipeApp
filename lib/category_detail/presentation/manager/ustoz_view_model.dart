// import 'package:flutter/material.dart';
// import 'package:recipe/features/categories/data/models/category_model.dart';
// import 'package:recipe/features/categories/data/repositories/category_repository.dart';
// import 'package:recipe/features/category_detail/data/models/recipe_model.dart';
// import 'package:recipe/features/category_detail/data/repositories/recipe_repository.dart';

// class CategoryDetailViewModel with ChangeNotifier {
//   CategoryDetailViewModel({
//     required CategoryRepository catRepo,
//     required RecipeRepository recipeRepo,
//     required int selectedId,
//   })  : _catRepo = catRepo,
//         _recipeRepo = recipeRepo,
//         selectedCategoryId = selectedId;
//   final CategoryRepository _catRepo;
//   final RecipeRepository _recipeRepo;

//   List<CategoryModel> categories = [];
//   List<RecipeModel> recipes = [];

//   bool right = true;

//   bool isLoading = true;

//   late CategoryModel _selected;
//   late int selectedCategoryId;

//   CategoryModel get selected => _selected;

//   set selected(CategoryModel model) {
//     if (categories.indexOf(_selected) < categories.indexOf(model)) {
//       right = true;
//     } else {
//       right = false;
//     }
//     notifyListeners();

//     _selected = model;
//     notifyListeners();
//     fetchRecipesByCategory(_selected.id);
//   }

//   Future<void> fetchRecipesByCategory(int categoryId) async {
//     recipes = await _recipeRepo.fetchRecipesByCategory(categoryId);
//     notifyListeners();
//   }

//   Future<void> load() async {
//     isLoading = true;
//     notifyListeners();
//     categories = await _catRepo.fetchCategories();
//     _selected = categories.singleWhere((category) => category.id == selectedCategoryId);
//     recipes = await _recipeRepo.fetchRecipesByCategory(selected.id);
//     isLoading = false;
//     notifyListeners();
//   }
// }