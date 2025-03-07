import 'package:chef_staff/categories/data/repositories/categories_repository.dart';
import 'package:chef_staff/category_detail/data/repositories/recipe_repository.dart';
import 'package:chef_staff/core/client.dart';
import 'package:chef_staff/core/routing/router.dart';
import 'package:chef_staff/core/sizes.dart';
import 'package:chef_staff/core/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    ScreenUtil.init(context, designSize: Size(430, 932));
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => ApiClient(),
        ),
        Provider(
          create: (context) => CategoriesRepository(
            client: context.read(),
          ),
        ),
        Provider(
          create: (context) => RecipeRepository(
            client: context.read(),
          ),
        ),
      ],
      builder: (context, child) => MaterialApp.router(
        theme: AppThemes.darkThemes,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
