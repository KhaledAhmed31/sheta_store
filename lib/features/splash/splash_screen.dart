import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheta_store/core/assets/assets.dart';
import 'package:sheta_store/core/routes/route_name.dart';
import 'package:sheta_store/features/auth/presentation/cubit/auth_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1500)).then(
      (value) => Navigator.pushReplacementNamed(
        // ignore: use_build_context_synchronously
        context,
        (context.read<AuthCubit>().checkToken())? RouteName.mainScreen : RouteName.signInScreen,
     
      ),
    );


    return Image.asset(
      Assets.splash,
      fit: BoxFit.cover,
    );
  }
}
