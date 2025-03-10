import 'package:chef_staff/categories/data/repositories/categories_repository.dart';
import 'package:chef_staff/core/client.dart';
import 'package:chef_staff/core/routing/routes.dart';
import 'package:chef_staff/recipe_comunity/data/repositories/recipe_comunity_repository.dart';
import 'package:chef_staff/recipe_comunity/presentation/manager/recipe_comunity_view_model.dart';
import 'package:chef_staff/recipe_comunity/presentation/pages/recipe_comunity_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../categories/data/models/categories_model.dart';
import '../../categories/presentation/manager/categories_cubit.dart';
import '../../categories/presentation/pages/categories_view.dart';
import '../../category_detail/presentation/manager/category_detail_view_model.dart';
import '../../category_detail/presentation/pages/category_detail_view.dart';
import '../../main.dart';
import '../../recipe_detail/presentation/manager/recipe_detail_view_model.dart';
import '../../recipe_detail/presentation/pages/recipe_detail_view.dart';

final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/community',
    routes: [
//       GoRoute(
//         path: "/onboarding_last",
//         builder: (context, state) => OnboardingLastPage(
//           vm: ChefStaffViewModel(
//             repo: ChefStaffRepository(
//               client: ApiClient(),
//             ),
//           ),
//         ),
//       ),
//       GoRoute(
//           path: "/profile",
//           builder: (context, state) => ChefStaffView(
//                 vm: ChefStaffViewModel(
//                     repo: ChefStaffRepository(client: ApiClient())),
//               )),
//       GoRoute(
//         path: "/",
//         builder: (context, state) => LoginView(
//           vm: LoginViewModel(
//             repo: AuthRepository(
//               client: ApiClient(),
//             ),
//           ),
//         ),
//       ),
      GoRoute(
        path: Routes.categories,
        builder: (context, state) => BlocProvider(
          create: (context) => CategoriesCubit(
            repo: context.read<CategoriesRepository>(),
          ),
          child: CategoriesView(),
        ),
      ),
//       GoRoute(path: "/signup", builder: (context, state) => SignUpView()),
//       GoRoute(
//           path: "/profileimage",
//           builder: (context, satate) => ProfileImagePicker()),
//       GoRoute(path: "/home", builder: (context, satate) => HomePageView()),
      GoRoute(
        path: Routes.categoryDetail,
        builder: (context, state) {
          return CategoryDetailView(
              vm: CategoryDetailViewModel(
                  catRepo: context.read(),
                  recipeRepo: context.read(),
                  selected: state.extra as CategoriesModel)
                ..load(),
              src: state.uri.queryParameters['src'] as String);
        },
      ),
      GoRoute(
        path: "${Routes.recipeDetail}/:recipeId",
        builder: (context, state) {
          return ChangeNotifierProvider(
            create: (context) => RecipeDetailViewModel(
              recipeRepo: context.read(),
              recipeId: int.parse(state.pathParameters['recipeId']!),
            ),
            child: RecipeDetailView(),
          );
        },
      ),
      GoRoute(
        path: Routes.community,
        builder: (context, state) => ChangeNotifierProvider(
          create: (context) => RecipeCommunityViewModel(
            recipeRepo: context.read<RecipeCommunityRepository>(),
          )..load(),
          child: RecipeCommunityView(),
        ),
      ),
    ]);
