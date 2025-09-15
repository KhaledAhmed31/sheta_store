import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sheta_store/core/dependency_injection/identifiers.dart';
import 'package:sheta_store/core/routes/route_name.dart';

import 'package:sheta_store/features/auth/data/models/sign_up_model.dart';
import 'package:sheta_store/features/auth/presentation/cubit/states/sign_up_error_state.dart';
import 'package:sheta_store/features/auth/presentation/cubit/states/sign_up_success_state.dart';

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
import '../cubit/states/sign_up_loading_state.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
 
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();  
    nameController.dispose(); 
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => getIt<AuthCubit>(),
      child: BlocListener<AuthCubit, AuthState>(listener: (context, state) {
        if (state is SignUpLoadingState) {
          context.loaderOverlay.show();
        } else if (state is SignUpSuccessState) {
          context.loaderOverlay.hide();
        } else if (state is SignUpErrorState) {
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
      
      },child:Scaffold(
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
                      Assets.logo2,
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
                    validator: (textValue) =>
                        Validators.nameValidator(textValue),
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
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context).signUp(
                            SignUpParams(
                                name: nameController.text,
                                phone: phoneController.text,
                                email: emailController.text,
                                password: passwordController.text));
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account? ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: FontSizeManager.s18),
                      ),
                      TextButton(
                        onPressed: () {
                         context.go(RouteName.signInScreen);
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
      )
      ),
    );
  }
}
