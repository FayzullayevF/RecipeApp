import 'package:chef_staff/categories/data/models/categories_model.dart';
import 'package:chef_staff/categories/data/repositories/categories_repository.dart';
import 'package:flutter/cupertino.dart';

class CategoriesViewModel extends ChangeNotifier {
  CategoriesViewModel({required CategoriesRepository repo}) : _repo = repo {
    load();
  }

  final CategoriesRepository _repo;
  List<CategoriesModel> categories = [];
  CategoriesModel? mainCategory;

  Future<void> load() async {
    try {
      var rawCategories = await _repo.fetchCategories();
      mainCategory = rawCategories.where((e) => e.main).firstOrNull;
      categories = rawCategories.where((e) => e.id != mainCategory?.id).toList();
    } finally {
      notifyListeners();
    }
  }
}
