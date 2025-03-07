import 'package:chef_staff/categories/data/models/categories_model.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryDetailAppbarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  const CategoryDetailAppbarBottom({
    super.key,
    required this.categories,
    required this.selected,
  });

  final List<CategoriesModel> categories;
  final CategoriesModel? selected;

  @override
  Size get preferredSize => const Size(double.infinity, 25);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return BottomItems(
            category: categories[index],
            selected: categories[index].id == selected?.id,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 15,
        ),
        itemCount: categories.length,
      ),
    );
  }
}

class BottomItems extends StatelessWidget {
  const BottomItems({
    super.key,
    required this.category,
    required this.selected,
  });

  final CategoriesModel category;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.go("/categorydetail", extra: category);
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 10),
        foregroundColor: selected ? Colors.white : AppColors.nameColor,
        backgroundColor: selected ? AppColors.nameColor : Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      child: Text(
        category.title,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
