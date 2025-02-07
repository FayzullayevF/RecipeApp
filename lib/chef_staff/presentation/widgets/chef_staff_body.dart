import 'package:chef_staff/chef_staff/presentation/pages/chef_staff_view_model.dart';
import 'package:chef_staff/chef_staff/presentation/widgets/chef_stuff_category_item.dart';
import 'package:flutter/material.dart';

class ChefStaffBody extends StatelessWidget {
  const ChefStaffBody({
    super.key,
    required this.vm,
  });

  final ChefStaffViewModel vm;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 17.5,
        mainAxisSpacing: 30,
      ),
      itemCount: vm.recipeModel.length,
      itemBuilder: (context, index) {
        return ChefStuffCategoryItem(
          image: vm.recipeModel[index].photo,
          title: vm.recipeModel[index].title,
          desc: vm.recipeModel[index].description,
          rating: vm.recipeModel[index].rating,
          time: vm.recipeModel[index].timeRequired,
        );
      },
    );
  }
}
