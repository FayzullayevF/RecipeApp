import 'package:chef_staff/chef_staff/data/repositories/chef_staff_repository.dart';
import 'package:chef_staff/chef_staff/presentation/pages/chef_staff_view_model.dart';
import 'package:chef_staff/client.dart';
import 'package:chef_staff/core/sizes.dart';
import 'package:chef_staff/onboarding/data/repositories/onboarding_page_repository.dart';
import 'package:chef_staff/onboarding/presentation/manager/onboarding_page_view_model.dart';
import 'package:chef_staff/onboarding/presentation/pages/onboarding_last_page.dart';
import 'package:chef_staff/onboarding/presentation/pages/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

final GoRouter router = GoRouter(
initialLocation: "/",
routes: [
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
  GoRoute(
    path: "/",
    builder: (context, state) => OnboardingView(vm: OnboardingViewModel(repo: OnboardingRepository(client: ApiClient())),)
  )
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
     routerConfig: router,
    );
  }
}
