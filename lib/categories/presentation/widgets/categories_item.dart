import 'dart:developer';

import 'package:chef_staff/categories/data/models/categories_model.dart';
import 'package:chef_staff/core/sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    super.key,
    this.main = false,
    required this.category,
    this.height = 145,
    this.width = 159,
  });

  final CategoriesModel category;
  final double width, height;
  final bool main;

  @override
  Widget build(BuildContext context) {
    Widget image = Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.network(
          category.image,
          width: width * AppSizes.wRatio,
          height: height * AppSizes.hRatio,
          fit: BoxFit.cover,
        ),
      ),
    );
    Widget title = Text(category.title,);
    return GestureDetector(
      onTap: () {
        log("category $category");
        context.go('/categorydetail', extra: category);
      },
      child: Column(
        children: [
          main ? title : image,
          SizedBox(height: 5,),
          main ? image : title,
        ],
      ),
    );
  }
}
