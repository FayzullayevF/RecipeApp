import 'package:chef_staff/core/exceptions/auth_exceptions.dart';
import 'package:chef_staff/core/interceptor.dart';
import 'package:chef_staff/core/secure_storage.dart';
import 'package:chef_staff/main.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';

class ApiClient {
  final Dio dio = Dio(BaseOptions(
      baseUrl: "http://10.10.0.75:8888/api/v1",
      validateStatus: (status) => true));

  Future<Map<String, dynamic>> fetchUser() async {
    var response = await dio.get("/auth/details");
    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      return data;
    } else{
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

  Future<String> signUp(
      String firstName,
      String lastName,
      String username,
      String email,
      String phoneNumber,
      String birthDate,
      String password) async {
    var response = await dio.post('/auth/register', data: {
      "username": username,
      "fullName": "$firstName $lastName",
      "email": email,
      "phoneNumber": phoneNumber,
      "birthDate": birthDate,
      "password": password,
    });
    if (response.statusCode == 200) {
      Map<String, String> data = Map<String, String>.from(response.data);
      return data['accessToken']!;
    } else {
      throw AuthException(message: "User not created");
    }
  }
  
  Future<dynamic> fetchRecipeById(int recipeId) async{
    var response = await dio.get("/recipes/detail/$recipeId");
    if (response.statusCode == 200){
      return response.data;
    }else{
      throw Exception("Recipe is not come from backend");
    }
  }
}

