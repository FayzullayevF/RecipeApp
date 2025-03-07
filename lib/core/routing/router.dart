import 'package:chef_staff/core/routing/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../categories/data/models/categories_model.dart';
import '../../categories/data/repositories/categories_repository.dart';
import '../../categories/presentation/manager/categories_view_model.dart';
import '../../categories/presentation/pages/categories_view.dart';
import '../../category_detail/data/repositories/recipe_repository.dart';
import '../../category_detail/presentation/manager/category_detail_view_model.dart';
import '../../category_detail/presentation/pages/category_detail_view.dart';
import '../../main.dart';
import '../client.dart';

final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: Routes.categories,
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
          builder: (context, state) => CategoriesView(
            vm: CategoriesViewModel(
              repo: context.read()
            ),
          )),
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
                  selected: state.extra as CategoriesModel
              )..load(),
              src: state.uri.queryParameters['src'] as String
          );
        },
      )
    ]);