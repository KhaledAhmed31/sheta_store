import 'package:flutter/material.dart';
import 'package:sheta_store/auth/sign_in/view/sign_in_screen.dart';
import 'package:sheta_store/common/ui/app_colors.dart';
import 'package:sheta_store/common/assets/assets.dart';
import 'package:sheta_store/common/fonts/font_size_manager.dart';
import 'package:sheta_store/common/ui/app_height.dart';
import 'package:sheta_store/common/ui/app_padding_margin.dart';
import 'package:sheta_store/common/validator/validators.dart';
import 'package:sheta_store/common/widgets/custom_text_feild.dart';
import 'package:sheta_store/common/widgets/sign_button.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.m17),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: AppMargin.m40),
                  child: Image.asset(
                   Assets.logo,
                  ),
                ),
                Text(
                  "Full Name",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: FontSizeManager.s18,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
                CustomTextFeild(
                  hint: "Enter your name",
                  controller: nameController,
                  validator: (textValue) => Validators.nameValidator(textValue),
                ),
                SizedBox(
                  height: AppHeight.h32,
                ),
                Text(
                  "Mobile number",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: FontSizeManager.s18,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
                CustomTextFeild(
                  hint: "Enter your mobile no.",
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (textValue) =>
                      Validators.phoneValidator(textValue),
                ),
                SizedBox(
                  height: AppHeight.h32,
                ),
                Text(
                  "E-mail address",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: FontSizeManager.s18,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
                CustomTextFeild(
                  hint: "Enter your email address",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (textValue) =>
                      Validators.emailValidator(textValue),
                ),
                SizedBox(
                  height: AppHeight.h32,
                ),
                Text(
                  "Password",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: FontSizeManager.s18,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
                CustomTextFeild(
                  hint: "Enter your password",
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (textValue) =>
                      Validators.passwordValidator(textValue),
                  isPass: true,
                ),
                SizedBox(
                  height: AppHeight.h32,
                ),
                SignButton(
                  title: "Sign Up",
                  onpressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      "Have an account? ",
                      style: TextStyle(color: Colors.white, fontSize: FontSizeManager.s18),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      style: TextButton.styleFrom(
                        minimumSize: const Size(0, 0),
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                           fontSize: FontSizeManager.s18,
                            color: Colors.white,
                            decorationColor: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationThickness: 2),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
