
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheta_store/auth/sign_in/view/sign_in_screen.dart';
import 'package:sheta_store/common/app_colors.dart';
import 'package:sheta_store/common/validator/validators.dart';
import 'package:sheta_store/common/widgets/custom_text_feild.dart';
import 'package:sheta_store/common/widgets/sign_button.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController nameController=TextEditingController();
  final TextEditingController phoneController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Image.asset(
                    "assets/name.png",
                  ),
                ),
                Text(
                  "Full Name",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
                CustomTextFeild(
                  hint: "Enter your name",
                  controller: nameController,
                  validator: (textValue) => Validators.nameValidator(textValue),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Text(
                  "Mobile number",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
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
                  height: 32.h,
                ),
                Text(
                  "E-mail address",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
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
                  height: 32.h,
                ),
                Text(
                  "Password",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
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
                  height: 32.h,
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
                    const Text(
                      "Have an account? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(),
                            ));
                      },
                      style: TextButton.styleFrom(
                        minimumSize: const Size(0, 0),
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
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
