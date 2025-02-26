import 'package:chef_staff/authentication/presentation/manager/auth_view_model.dart';
import 'package:chef_staff/authentication/presentation/widgets/recipe_password_form_field.dart';
import 'package:chef_staff/authentication/presentation/widgets/recipe_text_form_field.dart';
import 'package:chef_staff/core/presentations/recipe_eleveted_button.dart';
import 'package:chef_staff/core/sizes.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../widgets/page_text.dart';

class LoginView extends StatelessWidget {
  LoginView({
    super.key,
    required this.vm,
  });

  final LoginViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Login",
            style: TextStyle(
              color: AppColors.nameColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.padding36),
          child: ListView(children: [
            Form(
              key: vm.formKey,
              child: login_form_field(vm: vm),
            ),
            if (vm.hasError)
              Text(
                vm.errorMessage!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              )
          ]),
        ),
      ),
    );
  }
}

class login_form_field extends StatelessWidget {
  const login_form_field({
    super.key,
    required this.vm,
  });

  final LoginViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 10,
        children: [
          SizedBox(
            height: 70,
          ),
          RecipeTextFormField(
            title: "Login",
            hintText: "example@gmail.com",
            validator: (value) => null,
            controller: vm.loginController,
          ),
          RecipePasswordFormField(
            controller: vm.passwordController,
            title: "Password",
            validator: (value) => null,
          ),
          SizedBox(
            height: 40,
          ),
          RecipeElevatedButton(
              text: "Login",
              callback: () async {
                if (vm.formKey.currentState!.validate()) {
                  if (await vm.login() && context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Center(child: Text("banzay")),
                      ),
                    );
                  }else{
                    Center(child: Text("User not found", style: TextStyle(color: Colors.red),));
                  }
                }
              }),
          SizedBox(
            height: 15,
          ),
          RecipeElevatedButton(
              text: "Sign Up",
              callback: () {
                context.go('/signup');
              }),
          SizedBox(
            height: 25,
          ),
          PageText(
            size: 16,
            title: "Forgot Password?",
            weight: 600,
          ),
          SizedBox(
            height: 30,
          ),
          PageText(
            size: 13,
            title: "or sign up with",
            weight: 300,
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 31,
            width: 205,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset('assets/icons/instagram.svg'),
                SvgPicture.asset('assets/icons/google.svg'),
                SvgPicture.asset('assets/icons/facebook.svg'),
                SvgPicture.asset('assets/icons/wechat.svg'),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          PageText(
            size: 13,
            title: "Don’t have an account? Sign Up",
            weight: 300,
          ),
        ],
      ),
    );
  }
}
