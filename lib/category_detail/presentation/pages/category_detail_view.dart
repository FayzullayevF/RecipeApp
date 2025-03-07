import 'package:chef_staff/category_detail/presentation/manager/category_detail_view_model.dart';
import 'package:chef_staff/category_detail/presentation/widgets/category_detail_appbar.dart';
import 'package:chef_staff/core/presentations/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class CategoryDetailView extends StatelessWidget {
  const CategoryDetailView({
    super.key,
    required this.vm,
  });

  final CategoryDetailViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecipeAppBar(
        title: "Breakfast",
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 25),
          child: Row(),
        ),
      ),
      body: Placeholder(),
      bottomNavigationBar: BottomNavBarItem(),
    );
  }
}
