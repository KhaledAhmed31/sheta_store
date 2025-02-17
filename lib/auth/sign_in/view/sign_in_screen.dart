import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheta_store/auth/sign_up/view/sign_up.dart';
import 'package:sheta_store/common/app_colors.dart';
import 'package:sheta_store/common/validator/validators.dart';
import 'package:sheta_store/common/widgets/custom_text_feild.dart';
import 'package:sheta_store/common/widgets/sign_button.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController nameController=TextEditingController();
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
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Image.asset(
                    "assets/name.png",
                  ),
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp),
                ),
                const Text(
                  "Please sign in with your mail",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Text(
                  "User Name",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
                CustomTextFeild(
                    hint: "Enter your name",
                    controller: nameController,
                    validator: (textValue) =>
                        Validators.nameValidator(textValue)),
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
                TextButton(
                    style:
                        TextButton.styleFrom(alignment: Alignment.centerRight),
                    onPressed: () {},
                    child: Text(
                      "Forget password",
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    )),
                SizedBox(
                  height: 50.h,
                ),
                SignButton(
                  title: "Log In",
                  onpressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ));
                      },
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: const Text(
                        "Creat Account",
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
