import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/assets/assets.dart';
import '../../core/dependency_injection/identifiers.dart';
import '../../core/routes/route_name.dart';
import '../auth/presentation/cubit/auth_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1500)).then(
      (value) =>GoRouter.of(context).go((getIt.get<AuthCubit>().checkToken())?RouteName.mainScreen:RouteName.signInScreen),
    );
    return Image.asset(
      Assets.splash,
      fit: BoxFit.cover,
    );
  }
}
