import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheta_store/auth/data/models/sign_in_params.dart';
import 'package:sheta_store/auth/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:sheta_store/auth/sign_in/presentation/cubit/states/sign_in_state.dart';
import 'package:sheta_store/auth/sign_up/presentation/screens/sign_up.dart';
import 'package:sheta_store/common/ui/app_colors.dart';
import 'package:sheta_store/common/assets/assets.dart';
import 'package:sheta_store/common/fonts/font_size_manager.dart';
import 'package:sheta_store/common/ui/app_height.dart';
import 'package:sheta_store/common/ui/app_padding_margin.dart';
import 'package:sheta_store/common/validator/validators.dart';
import 'package:sheta_store/common/widgets/custom_text_feild.dart';
import 'package:sheta_store/common/widgets/sign_button.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInCubit>(
      create: (context) => SignInCubit(),
      child: BlocBuilder<SignInCubit, SignInState>(
        builder: (context, state) => Scaffold(
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
                      padding: EdgeInsets.symmetric(vertical: AppMargin.m40),
                      child: Image.asset(
                        Assets.logo2,
                      ),
                    ),
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: FontSizeManager.s22),
                    ),
                    const Text(
                      "Please sign in with your mail",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: AppHeight.h35,
                    ),
                    Text(
                      "Email",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: FontSizeManager.s22,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                    CustomTextFeild(
                        hint: "Enter your email",
                        controller: emailController,
                        validator: (textValue) =>
                            Validators.nameValidator(textValue)),
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
                    TextButton(
                        style: TextButton.styleFrom(
                            alignment: Alignment.centerRight),
                        onPressed: () {},
                        child: Text(
                          "Forget password",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: FontSizeManager.s18),
                        )),
                    SizedBox(
                      height: AppHeight.h50,
                    ),
                    SignButton(
                      title: "Log In",
                      onpressed: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<SignInCubit>(context).signIn(
                              SignInParams(
                                  email: emailController.text,
                                  password: passwordController.text));
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: FontSizeManager.s18),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ));
                          },
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.all(AppPadding.p0)),
                          child: Text(
                            "Creat Account",
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
        ),
      ),
    );
  }
}
