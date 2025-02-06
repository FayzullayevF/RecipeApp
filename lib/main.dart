import 'package:chef_staff/chef_staff/data/repositories/chef_staff_repository.dart';
import 'package:chef_staff/chef_staff/presentation/pages/chef_staff_view_model.dart';
import 'package:chef_staff/chef_staff/presentation/pages/chef_staff_view.dart';
import 'package:chef_staff/client.dart';
import 'package:chef_staff/core/sizes.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChefStaffView(vm: ChefStaffViewModel(repo: ChefStaffRepository(client: ApiClient()))),
    );
  }
}
