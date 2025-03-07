import 'dart:developer';

import 'package:chef_staff/categories/data/models/categories_model.dart';
import 'package:chef_staff/core/sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routing/routes.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    super.key,
    required this.category,
  });

  final CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    Widget image = Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.network(
          category.image,
          width: category.main ? 365 : 160,
          height: category.main ? 150 : 145,
          fit: BoxFit.cover,
        ),
      ),
    );
    Widget title = Text(
      category.title,
      style: TextStyle(
        color: Colors.white,
      ),
    );
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).go("${Routes.categoryDetail}?src=${Routes.categories}", extra: category);
      },
      child: Column(
        spacing: category.main ? 3 : 1,
        children: [
          category.main ? title : image,
          SizedBox(
            height: 5,
          ),
          category.main ? image : title,
        ],
      ),
    );
  }
}
