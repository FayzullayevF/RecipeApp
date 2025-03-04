import 'dart:io';

import 'package:chef_staff/authentication/data/models/user_model.dart';
import 'package:chef_staff/core/exceptions/auth_exceptions.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio(BaseOptions(
      baseUrl: "http://10.10.1.91:8000/api/v1",
      validateStatus: (status) => true));

  Future<Map<String, dynamic>> fetchUser() async {
    var response = await dio.get("/auth/details");
    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      return data;
    } else {
      throw AuthException(message: "Auth error!");
    }
  }

  Future<List<Map<String, dynamic>>> fetchRecipes() async {
    var responseRecipe = await dio.get("/recipes/list");
    if (responseRecipe.statusCode == 200) {
      List<Map<String, dynamic>> dataRecipe =
          List<Map<String, dynamic>>.from(responseRecipe.data);
      return dataRecipe;
    } else {
      throw Exception("Failed to load recipes list");
    }
  }

  Future<List<dynamic>> fetchOnboardingPages() async {
    var responseOnboarding = await dio.get("/onboarding/list");
    if (responseOnboarding.statusCode == 200) {
      List<dynamic> data = responseOnboarding.data;
      return data;
    } else {
      throw Exception("Failed to load onboarding pages");
    }
  }

  Future<List<Map<String, dynamic>>> fetchCategories() async {
    var responseCategories = await dio.get('/categories/list');
    if (responseCategories.statusCode == 200) {
      List<dynamic> data = responseCategories.data;
      return data.map((e) => e as Map<String, dynamic>).toList();
    } else {
      throw Exception("Failed to load categories page");
    }
  }

  Future<String> login(String login, String password) async {
    var response = await dio.post(
      '/auth/login',
      data: {'login': login, "password": password},
    );
    if (response.statusCode == 200) {
      Map<String, String> data = Map<String, String>.from(response.data);
      return data['accessToken']!;
    } else {
      throw AuthException(message: "User not found");
    }
  }

  Future<bool> signUp(UserModels model) async {
    var response = await dio.post('/auth/register', data: model.toJson());
    return response.statusCode == 201 ? true : false;
  }

  Future<dynamic> fetchRecipeById(int recipeId) async {
    var response = await dio.get("/recipes/detail/$recipeId");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Recipe is not come from backend");
    }
  }

  Future<bool> uploadProfilePhoto(File file) async {
    FormData formData = FormData.fromMap({
      "profilePhoto": await MultipartFile.fromFile(file.path,
          filename: file.path.split("/").last)
    });
    var response = await dio.patch(
      "/auth/upload",
      data: formData,
      options: Options(headers: {"Content-Type": "multipart/form-data"}),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
