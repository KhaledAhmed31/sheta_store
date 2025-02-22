import 'package:flutter/material.dart';
import 'package:sheta_store/auth/sign_in/presentation/screens/sign_in_screen.dart';
import 'package:sheta_store/common/assets/assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1500)).then(
      (value) => Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (_) => SignIn(),
        ),
      ),
    );

    return Image.asset(
      Assets.splash,
      fit: BoxFit.cover,
    );
  }
}
