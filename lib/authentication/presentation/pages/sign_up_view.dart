import 'package:chef_staff/authentication/presentation/widgets/page_text.dart';
import 'package:chef_staff/authentication/presentation/widgets/recipe_password_form_field.dart';
import 'package:chef_staff/authentication/presentation/widgets/recipe_text_form_field.dart';
import 'package:chef_staff/core/presentations/recipe_eleveted_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/sizes.dart';
import '../../../core/utils/utils.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final controller = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  final controller5 = TextEditingController();
  final controller6 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sign Up",
          style: TextStyle(
            color: AppColors.nameColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(padding: EdgeInsets.symmetric(horizontal: AppSizes.padding36),
          children: [
            Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40,),
                RecipeTextFormField(hintText: "John Doe", validator: (value)=> null , controller: controller, title: "Full Name"),
                RecipeTextFormField(hintText: "example@gmail.com", validator: (value)=> null , controller: controller2, title: "Email"),
                RecipeTextFormField(hintText: "+123 456 789", validator: (value)=> null , controller: controller3, title: "Mobile Number"),
                RecipeTextFormField(hintText: "DD / MM / YYYY", validator: (value)=> null , controller: controller3, title: "Date of Birth"),
                RecipePasswordFormField(
                  controller: controller4,
                  title: "Password",
                ),RecipePasswordFormField(
                  controller: controller5,
                  title: "Confirm Password",
                ),
                PageText(title: "By continuing, you agree to", size: 14, weight: 400),
                PageText(title: " Terms of Use and Privacy Policy.", size: 14, weight: 600),
                RecipeElevatedButton(text: "Sign Up", callback: (){context.go('/');}),
                PageText(title: "Already have an account?  Log In", size: 13, weight: 300)
            ],)
      ]),
    );
  }
}
