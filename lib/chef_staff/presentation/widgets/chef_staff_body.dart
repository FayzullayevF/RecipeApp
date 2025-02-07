import 'package:chef_staff/chef_staff/presentation/pages/chef_staff_view_model.dart';
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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 17.5,
        mainAxisSpacing: 30,
      ),
      itemCount: vm.recipeModel.length,
      itemBuilder: (context, index) {

      },
    );
  }
}
