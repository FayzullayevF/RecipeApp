import 'package:chef_staff/categories/presentation/manager/categories_view_model.dart';
import 'package:chef_staff/categories/presentation/widgets/categories_item.dart';
import 'package:chef_staff/categories/presentation/widgets/recipe_appbar.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.vm});

  final CategoriesViewModel vm;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody:  true,
      backgroundColor: AppColors.mainBackgroundColor,
      appBar: RecipeAppbar(title: "Categories",),
      body: CategoryPageItem(vm: vm),
    );
  }
}

class CategoryPageItem extends StatelessWidget {
  const CategoryPageItem({super.key, required this.vm});

  final CategoriesViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: vm,
        builder: (context, child) {
          return ListView(
            shrinkWrap: true,
            padding: EdgeInsets.fromLTRB(38.w, 20.h, 38.w, 100.h),
            children: [
              if (vm.mainCategory != null)
                CategoriesItem(
                  category: vm.mainCategory!,
                  width: 356.w,
                  height: 148.h,
                  main: true,
                ),
              SizedBox(
                height: 35,
              ),
              GridView.builder(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                ),
                itemCount: vm.categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        final selectedCategory = vm.categories[index];
                        context.go("/categorydetail", extra: selectedCategory);
                      },
                      child: CategoriesItem(category: vm.categories[index]));
                },
              ),
            ],
          );
        });
  }
}
