import 'package:chef_staff/categories/data/models/categories_model.dart';
import 'package:chef_staff/core/sizes.dart';
import 'package:flutter/material.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    super.key,
    this.main = false,
    required this.model,
    this.height = 145,
    this.width = 159,
  });

  final CategoriesModel model;
  final double width, height;
  final bool main;

  @override
  Widget build(BuildContext context) {
    Widget image = Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.network(model.image,
          width: width * AppSizes.wRatio,
          height: height * AppSizes.hRatio,
          fit: BoxFit.cover,
        ),
      ),
    );
    Widget title = Text(model.title, style: TextStyle(color: Colors.white),);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          main ? title : image,
          main ? image : title,
        ],
      ),
    );
  }
}
