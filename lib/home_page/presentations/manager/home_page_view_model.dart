import 'package:chef_staff/categories/data/models/categories_model.dart';
import 'package:chef_staff/categories/data/repositories/categories_repository.dart';
import 'package:flutter/material.dart';

class HomePageViewModel extends ChangeNotifier {
  HomePageViewModel({required CategoriesRepository categoryRepo})
      : _categoryRepo = categoryRepo {
    load();
  }

  final CategoriesRepository _categoryRepo;

  List<CategoriesModel> category = [];

  Future<void> load() async {
    try {
      category = await _categoryRepo.fetchCategories();
    } finally {
      notifyListeners();
    }
  }
}
