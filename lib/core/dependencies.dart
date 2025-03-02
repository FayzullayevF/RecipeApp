
import 'package:chef_staff/authentication/data/repositories/auth_repository.dart';
import 'package:chef_staff/categories/data/repositories/categories_repository.dart';
import 'package:chef_staff/chef_staff/data/repositories/chef_staff_repository.dart';
import 'package:chef_staff/core/client.dart';
import 'package:chef_staff/onboarding/data/repositories/onboarding_page_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  Provider(create: (context)=> ApiClient()),
  Provider(create: (context)=> AuthRepository(client: context.read())),
  Provider(create: (context)=> CategoriesRepository(client: context.read())),
  Provider(create: (context)=> ChefStaffRepository(client: context.read())),
  Provider(create: (context)=> OnboardingRepository(client: context.read()))
];