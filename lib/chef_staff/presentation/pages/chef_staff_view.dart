import 'package:chef_staff/chef_staff/data/repositories/chef_staff_repository.dart';
import 'package:chef_staff/chef_staff/presentation/pages/chef_staff_view_model.dart';
import 'package:chef_staff/chef_staff/presentation/pages/profile_scaffold_tab_bar.dart';
import 'package:chef_staff/chef_staff/presentation/widgets/chef_staff_app_bar.dart';
import 'package:chef_staff/client.dart';
import 'package:chef_staff/core/utils.dart';
import 'package:flutter/material.dart';

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
        extendBody: true,
        backgroundColor: AppColors.mainBackgroundColor,
        appBar: ChefStaffAppBarBody(vm: vm),
        body: ProfileScaffoldTabBar(vm: ChefStaffViewModel(repo: ChefStaffRepository(client: ApiClient())),),
      ),
    );
  }
}
