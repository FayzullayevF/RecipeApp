import 'package:chef_staff/chef_staff/presentation/pages/chef_staff_view_model.dart';
import 'package:chef_staff/chef_staff/presentation/widgets/chef_staff_app_bar.dart';
import 'package:chef_staff/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChefStaffView extends StatelessWidget {
  const ChefStaffView({super.key, required this.vm});

  final ChefStaffViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) => DefaultTabController(
          length: 2,
          child: switch (vm.loading) {
            true => CircularProgressIndicator(),
            false => ProfileScaffold(vm: vm)
          }),
    );
  }
}

class ProfileScaffold extends StatelessWidget {
  const ProfileScaffold({super.key, required this.vm});

  final ChefStaffViewModel vm;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.mainBackgroundColor,
        appBar: ChefStaffAppBarBody(vm: vm),
        body: TabBarView(children: [
          Center(
            child: Text("1", style: TextStyle(color: Colors.white),),
          ),
          Center(
            child: Text("2", style: TextStyle(color: Colors.white)),
          )
        ]),
      ),
    );
  }
}
