import 'package:chef_staff/authentication/data/repositories/auth_repository.dart';
import 'package:chef_staff/authentication/presentation/manager/sign_up_view_model.dart';
import 'package:chef_staff/authentication/presentation/widgets/page_text.dart';
import 'package:chef_staff/authentication/presentation/widgets/recipe_date_of_birth_field.dart';
import 'package:chef_staff/authentication/presentation/widgets/recipe_password_form_field.dart';
import 'package:chef_staff/authentication/presentation/widgets/recipe_text_form_field.dart';
import 'package:chef_staff/core/client.dart';
import 'package:chef_staff/core/presentations/recipe_eleveted_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/sizes.dart';
import '../../../core/utils/utils.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpViewModel>(
      create: (context) =>
          SignUpViewModel(authRepo: AuthRepository(client: ApiClient())),
      builder: (context, index) {
        final vm = context.read<SignUpViewModel>();
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
          body: ListView(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.padding36),
              children: [
                Form(
                  key: vm.formKey,
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      RecipeTextFormField(
                          hintText: "Firts Name",
                          validator: (value) => null,
                          controller: vm.firstNameController,
                          title: "First Name"),
                      RecipeTextFormField(
                          hintText: "Last Name",
                          validator: (value) => null,
                          controller: vm.lastNameController,
                          title: "Last Name"),
                      RecipeTextFormField(
                          hintText: "UserName",
                          validator: (value) => null,
                          controller: vm.userNameContorller,
                          title: "Username"),
                      RecipeTextFormField(
                          hintText: "example@gmail.com",
                          validator: (value) => null,
                          controller: vm.emailController,
                          title: "Email"),
                      RecipeTextFormField(
                          hintText: "+123 456 789",
                          validator: (value) => null,
                          controller: vm.phoneNumberController,
                          title: "Mobile Number"),
                      RecipeDateOfBirthField(),
                      RecipePasswordFormField(
                        controller: vm.passwordController,
                        title: "Password",
                        validator: (value) => null,
                      ),
                      RecipePasswordFormField(
                        controller: vm.confirmPasswordController,
                        title: "Confirm Password",
                        validator: (value) {
                          if (vm.passwordController.text !=
                              vm.confirmPasswordController.text) {
                            return "Password do not match";
                          } else {
                            return null;
                          }
                        },
                      ),
                      PageText(
                          title: "By continuing, you agree to",
                          size: 14,
                          weight: 400),
                      PageText(
                          title: " Terms of Use and Privacy Policy.",
                          size: 14,
                          weight: 600),
                      RecipeElevatedButton(
                          text: "Sign Up",
                          callback: () async {
                            context
                                .read<SignUpViewModel>()
                                .formKey
                                .currentState!
                                .validate();
                            if (await vm.signUp() && context.mounted) {
                              showDialog(
                                  context: context,
                                  builder: (context) => Center(
                                          child: Container(
                                        height: 286,
                                        width: 250,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(40),
                                        ),
                                        child: Column(
                                          children: [
                                            Text("Sign Up Succesfully!"),
                                          ],
                                        ),
                                      )));
                            }
                          }),
                      PageText(
                          title: "Already have an account?  Log In",
                          size: 13,
                          weight: 300),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ]),
        );
      },
    );
  }
}
