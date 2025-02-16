import 'package:chef_staff/core/client.dart';

import '../models/categories_model.dart';

class CategoriesRepository{

  CategoriesRepository({required this.client});
  final ApiClient client;
  List<CategoriesModel> categories = [];

  Future<List<CategoriesModel>> fetchCategories() async{
    if(categories.isNotEmpty) return categories;
    var rawCategories = await client.fetchCategories();
    categories = rawCategories.map((e)=> CategoriesModel.fromJson(e)).toList();
    return categories;
  }
}