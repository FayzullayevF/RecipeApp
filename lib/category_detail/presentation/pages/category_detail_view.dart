import 'package:chef_staff/category_detail/presentation/manager/category_detail_view_model.dart';
import 'package:chef_staff/category_detail/presentation/widgets/recipe_app_bar_bottom.dart';
import 'package:chef_staff/category_detail/presentation/widgets/recipe_item.dart';
import 'package:chef_staff/category_detail/presentation/widgets/category_detail_appbar.dart';
import 'package:chef_staff/core/presentations/bottom_navigation_bar.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryDetailView extends StatelessWidget {
  const CategoryDetailView({super.key, required this.vm, required this.src});

  final CategoryDetailViewModel vm;
  final String src;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) {
        if (vm.isLoading) {
          // Future.delayed(Duration(seconds: 5));
          return Center(
            child: CupertinoActivityIndicator(
              color: AppColors.nameColor,
            ),
          );
        } else {
          return Scaffold(
            extendBody: true,
            appBar: RecipeAppBar(
              title: vm.selected.title,
              bottom: RecipeAppBarBottom(vm: vm),
              backButtonCallBack: () => context.go(src),
            ),
            body: GridView.builder(
              padding: EdgeInsets.fromLTRB(16, 36, 12, 120),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 226, mainAxisSpacing: 30),
              itemCount: vm.recipes.length,
              itemBuilder: (context, index) =>
                  RecipeItem(recipeModel: vm.recipes[index]),
            ),
            bottomNavigationBar: RecipeBottomNavigationBar(),
          );
        }
      },
    );
  }
}
