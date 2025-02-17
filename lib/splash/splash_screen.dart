import 'package:flutter/material.dart';
import 'package:sheta_store/auth/sign_in/view/sign_in_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3000)).then(
      (value) => Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (_) => SignIn(),
        ),
      ),
    );

    return Image.asset(
      "assets/splash.jpg",
      fit: BoxFit.cover,
    );
  }
}
