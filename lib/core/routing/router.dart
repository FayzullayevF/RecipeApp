import 'package:chef_staff/authentication/presentation/pages/login_view.dart';
import 'package:chef_staff/authentication/presentation/pages/sign_up_view.dart';
import 'package:chef_staff/categories/presentation/pages/categories_view.dart';
import 'package:chef_staff/chef_staff/presentation/pages/chef_staff_view.dart';
import 'package:chef_staff/core/routing/routes.dart';
import 'package:chef_staff/onboarding/presentation/pages/onboarding_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

GoRouter router() => GoRouter(initialLocation: Routes.login, routes: [
      GoRoute(
          path: Routes.home,
          builder: (context, state) => LoginView(vm: context.read())),
      GoRoute(
          path: Routes.categories,
          builder: (context, state) => CategoriesView(vm: context.read())),
      GoRoute(
          path: Routes.profile,
          builder: (context, state) => ChefStaffView(vm: context.read())),
      GoRoute(
          path: Routes.login,
          builder: (context, state) => LoginView(vm: context.read())),
      GoRoute(
          path: Routes.onboarding,
          builder: (context, state) => OnboardingView(vm: context.read())),
      GoRoute(
        path: Routes.signUp,
        builder: (context, state) => SignUpView(),
      )
    ]);
