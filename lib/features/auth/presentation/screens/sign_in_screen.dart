import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sheta_store/features/auth/data/models/sign_in_params.dart';
import 'package:sheta_store/features/auth/presentation/cubit/states/error_state.dart';
import 'package:sheta_store/features/auth/presentation/cubit/states/loading_state.dart';
import 'package:sheta_store/features/auth/presentation/cubit/states/success_state.dart';
import 'package:sheta_store/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/core/assets/assets.dart';
import 'package:sheta_store/core/fonts/font_size_manager.dart';
import 'package:sheta_store/core/ui/app_height.dart';
import 'package:sheta_store/core/ui/app_padding_margin.dart';
import 'package:sheta_store/core/validator/validators.dart';
import 'package:sheta_store/core/widgets/custom_text_feild.dart';
import 'package:sheta_store/core/widgets/sign_button.dart';

import '../cubit/auth_cubit.dart';
import '../cubit/states/sign_in_state.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInLoadingState) {
          context.loaderOverlay.show();
        } else if (state is SignInSuccessState) {
          context.loaderOverlay.hide();
        } else if (state is SignInErrorState) {
          context.loaderOverlay.hide();
          Fluttertoast.showToast(
              msg: state.errorMessage,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.white,
              textColor: AppColors.main,
              fontSize: 16.0);
        }
      },
      child: Scaffold(
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
                        Validators.signInPasswordValidator(textValue),
                    isPass: true,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          alignment: Alignment.centerRight),
                      onPressed: () {},
                      child: Text(
                        "Forget password",
                        style: TextStyle(
                            color: Colors.white, fontSize: FontSizeManager.s18),
                      )),
                  SizedBox(
                    height: AppHeight.h50,
                  ),
                  SignButton(
                    title: "Log In",
                    onpressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context).signIn(SignInParams(
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
                            color: Colors.white, fontSize: FontSizeManager.s18),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
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
    );
  }
}
