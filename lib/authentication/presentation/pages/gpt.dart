// import 'package:dio/dio.dart';
// import 'package:go_router/go_router.dart';
// import 'package:profile/core/core.dart';
// import 'package:profile/core/exceptions/auth_exception.dart';
// import 'package:profile/core/interceptor.dart';
// import 'package:profile/core/routing/routes.dart';
// import 'package:profile/core/secure_storage.dart';

// class ApiClient {
//   ApiClient() {
//     dio.interceptors.add(AuthInterceptor());
//   }

//   final Dio dio = Dio(BaseOptions(baseUrl: "http://192.168.1.80/api/v1"));

//   Future<String> login(String login, String password) async {
//     var response = await dio.post(
//       '/auth/login',
//       data: {"login": login, "password": password},
//     );

//     if (response.statusCode == 200) {
//       Map<String, String> data = Map<String, String>.from(response.data);
//       return data['accessToken']!;
//     } else {
//       throw AuthException(message: "Login qilib bo'madi, xullasi nimadur noto'g'ri ketgan.");
//     }
//   }

//   Future<Map<String, dynamic>> fetchMyProfile() async {
//     var response = await dio.get('/auth/me');
//     if (response.statusCode == 200) {
//       Map<String, dynamic> data = response.data;
//       return data;
//     } else if (response.statusCode == 401) {
//       final credentials = await SecureStorage.getCredentials();
//       if (credentials['login'] == null || credentials['password'] == null) {
//         navigatorKey.currentContext!.go(Routes.login);
//       }
//       final jwt = await login(credentials['login']!, credentials['password']!);
//       await SecureStorage.deleteToken();
//       await SecureStorage.saveToken(jwt);
//       var response = await dio.get('/auth/me');
//       if (response.statusCode == 200) {
//         Map<String, dynamic> data = response.data;
//         return data;
//       } else{
//         navigatorKey.currentContext!.go(Routes.login);
//       }
//     }
//   }

//   Future<List<dynamic>> fetchOnboardingPages() async {
//     var response = await dio.get("/onboarding/list");
//     if (response.statusCode == 200) {
//       List<dynamic> data = response.data;
//       return data;
//     } else {
//       throw Exception("Failed to load onboarding pages");
//     }
//   }
// }