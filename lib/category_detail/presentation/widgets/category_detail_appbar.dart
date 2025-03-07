import 'package:chef_staff/core/presentations/app_bar_actions.dart';
import 'package:chef_staff/core/presentations/recipe_icon_button.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';

class RecipeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RecipeAppBar({
    super.key,
    required this.title,
    this.bottom,
    this.toolBarHeight = 72
  });

  final String title;
  final PreferredSizeWidget? bottom;
  final double toolBarHeight;

  @override
  Size get preferredSize {
    final double? bottomHeight = bottom?.preferredSize.height;
    final height = bottomHeight == null ? toolBarHeight : bottomHeight + toolBarHeight;
    return  Size(double.infinity, height);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 10),
      child: AppBar(
        toolbarHeight: toolBarHeight,
        leadingWidth: 25,
        leading: Align(
            alignment: Alignment.centerLeft,
            child: RecipeIconButton(
              image: "assets/icons/back-arrow.svg",
              width: 25,
              height: 17,
              callback: () {},
            )),
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.nameColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Row(
            children: [
              AppBarActions(
                svg: "assets/icons/notification.svg",
                color: AppColors.actionContainerColor,
                svg_Color: AppColors.pinkSubColor,
                
              ),
              SizedBox(width: 5,),
              AppBarActions(
                svg: "assets/icons/search.svg",
                color: AppColors.actionContainerColor,
                svg_Color: AppColors.pinkSubColor,
              ),
            ],
          )
        ],
        bottom: bottom
      ),
    );
  }
}
