import 'package:chef_staff/core/presentations/app_bar_all.dart';
import 'package:flutter/material.dart';

class ProfileImagePicker extends StatelessWidget {
  const ProfileImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(50), child: AppBarAll(title: "Profile")),
    );
  }
}