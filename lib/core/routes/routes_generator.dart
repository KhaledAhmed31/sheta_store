import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheta_store/core/routes/route_name.dart';
import 'package:sheta_store/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:sheta_store/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:sheta_store/features/main_layout/presentation/main_layout.dart';
import 'package:sheta_store/features/product/domain/entities/product_entity.dart';
import 'package:sheta_store/features/product/presentation/pages/product_details.dart';
import 'package:sheta_store/features/product/presentation/pages/product_list.dart';

import '../../features/splash/splash_screen.dart';

class RoutesGenerator {
  static GoRouter getRoute = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => SplashScreen()),
      GoRoute(
        path: RouteName.signInScreen,
        pageBuilder:
            (context, state) => CustomTransitionPage(
              child: SignInScreen(),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      SlideTransition(
                        position: animation.drive(
                          Tween(
                            begin: const Offset(1.5, 0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.ease)),
                        ),
                        child: child,
                      ),
              reverseTransitionDuration: Duration(milliseconds: 500),
            ),
      ),
      GoRoute(
        path: RouteName.signUpScreen,
        pageBuilder:
            (context, state) => CustomTransitionPage(
              child: SignUpScreen(),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      SlideTransition(
                        position: animation.drive(
                          Tween(
                            begin: const Offset(1.5, 0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.ease)),
                        ),
                        child: child,
                      ),
            ),
      ),
      GoRoute(
        path: RouteName.mainScreen,
        pageBuilder:
            (context, state) => CustomTransitionPage(
              child: MainScreen(),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      SlideTransition(
                        position: animation.drive(
                          Tween(
                            begin: const Offset(1.5, 0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.ease)),
                        ),
                        child: child,
                      ),
            ),
      ),
      GoRoute(
        path: RouteName.productScreen,
        pageBuilder:
            (context, state) => CustomTransitionPage(
              child: ProductScreen(catId: state.extra as String,),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      SlideTransition(
                        position: animation.drive(
                          Tween(
                            begin: const Offset(1.5, 0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.ease)),
                        ),
                        child: child,
                      ),
              reverseTransitionDuration: Duration(milliseconds: 500),
            ),
      ),
      GoRoute(
        path: RouteName.productDetailScreen,
        pageBuilder:
            (context, state) => CustomTransitionPage(
              child: ProductDetails(product: state.extra as ProductEntity,),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      SlideTransition(
                        position: animation.drive(
                          Tween(
                            begin: const Offset(1.5, 0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.ease)),
                        ),
                        child: child,
                      ),
              reverseTransitionDuration: Duration(milliseconds: 500),
            ),
      ),
    ],
  );
}
