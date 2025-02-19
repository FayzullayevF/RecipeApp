import 'package:chef_staff/authentication/data/repositories/auth_repository.dart';
import 'package:chef_staff/authentication/presentation/manager/auth_view_model.dart';
import 'package:chef_staff/authentication/presentation/pages/login_view.dart';
import 'package:chef_staff/authentication/presentation/pages/sign_up_view.dart';
import 'package:chef_staff/chef_staff/data/repositories/chef_staff_repository.dart';
import 'package:chef_staff/chef_staff/presentation/pages/chef_staff_view.dart';
import 'package:chef_staff/chef_staff/presentation/pages/chef_staff_view_model.dart';
import 'package:chef_staff/core/client.dart';
import 'package:chef_staff/core/sizes.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:chef_staff/onboarding/presentation/pages/onboarding_last_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

final GoRouter router = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    path: "/onboarding_last",
    builder: (context, state) => OnboardingLastPage(
      vm: ChefStaffViewModel(
        repo: ChefStaffRepository(
          client: ApiClient(),
        ),
      ),
    ),
  ),
  // GoRoute(
  //     path: "/",
  //     builder: (context, state) => LoginView()),
  GoRoute(
    path: "/",
    builder: (context, state) => LoginView(
      vm: LoginViewModel(
        repo: AuthRepository(
          client: ApiClient(),
        ),
      ),
    ),
  ),
  GoRoute(path: "/signup", builder: (context, state) => SignUpView()),
  GoRoute(path: "/profile", builder: (context, state) => ChefStaffView(vm: ChefStaffViewModel(repo: ChefStaffRepository(client: ApiClient())))),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: AppColors.nameColor,
            onPrimary: Colors.white,
            secondary: AppColors.actionContainerColor,
            onSecondary: AppColors.pinkSubColor,
            error: Colors.red,
            onError: Colors.white,
            surface: AppColors.mainBackgroundColor,
            onSurface: AppColors.nameColor),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
