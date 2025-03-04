import 'package:chef_staff/categories/presentation/manager/categories_view_model.dart';
import 'package:chef_staff/categories/presentation/widgets/categories_item.dart';
import 'package:chef_staff/core/presentations/app_bar_all.dart';
import 'package:chef_staff/core/sizes.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.vm});

  final CategoriesViewModel vm;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      appBar: AppBarAll(
        title: 'Categories',
        leading: "assets/icons/back-arrow.svg",
        action1: 'assets/icons/home.svg',
        action2: 'assets/icons/heart.svg',
      ),
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
            padding: EdgeInsets.fromLTRB(
                38.w, 20.h, 38.w, 100.h),
            children: [
              if (vm.mainCategory != null)
                CategoriesItem(
                  model: vm.mainCategory!,
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
                  return CategoriesItem(model: vm.categories[index]);
                },
              ),
            ],
          );
        });
  }
}
