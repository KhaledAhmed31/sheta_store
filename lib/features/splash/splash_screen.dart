import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheta_store/core/assets/assets.dart';
import 'package:sheta_store/features/auth/presentation/cubit/auth_cubit.dart';
import '../auth/presentation/screens/sign_in_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1500)).then(
      (value) => Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (_) => (context.read<AuthCubit>().checkToken())?Container() : SignIn(),
        ),
      ),
    );

    return Image.asset(
      Assets.splash,
      fit: BoxFit.cover,
    );
  }
}
