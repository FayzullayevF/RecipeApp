import 'package:chef_staff/recipe_detail.dart/data/model/ingredient.dart';
import 'package:chef_staff/recipe_detail.dart/data/model/instructions.dart';
import 'package:chef_staff/recipe_detail.dart/data/model/user_model.dart';

class RecipeDetailModel {
  final int id, categoryId;
  final String title, description;
  final String photo, videoRecipe;
  final num rating;
  final UserModel user;
  final List<Instructions> instructions;
  final List<Ingredient> ingredient;

  RecipeDetailModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.photo,
    required this.videoRecipe,
    required this.rating,
    required this.user,
    required this.instructions,
    required this.ingredient,
  });

  factory RecipeDetailModel.fromJson(Map<String, dynamic> json) {
    return RecipeDetailModel(
      id: json['id'],
      categoryId: json['categoryId'],
      title: json['title'],
      description: json['description'],
      photo: json['photo'],
      videoRecipe: json['videoRecipe'],
      rating: json['rating'],
      user: UserModel.fromJson(json['user']),
      instructions: (json['instructions'] as List<dynamic>).map((instructions)=> Instructions.fromJson(instructions)).toList(),
      ingredient: (json['ingredients']as List<dynamic>).map((ingredients)=> Ingredient.fromJson(ingredients)).toList(),
    );
  }
}
