import 'package:chef_staff/chef_staff/presentation/pages/chef_staff_view_model.dart';
import 'package:flutter/material.dart';

class ProfileScaffoldTabBar extends StatelessWidget {
  const ProfileScaffoldTabBar({
    super.key,
    required this.vm
  });

  final ChefStaffViewModel vm;

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      Center(
        child: Text("1", style: TextStyle(color: Colors.white)),
      ),
      Center(
        child: Text("2", style: TextStyle(color: Colors.white)),
      )
    ]);
  }
}
