
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sheta_store/core/dependency_injection/identifiers.dart';
import 'package:sheta_store/core/notificaton%20service/notification_service.dart';
import 'package:sheta_store/core/routes/routes_generator.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/core/ui/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheta_store/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:sheta_store/features/categories/presentation/cubit/categories_cubit.dart';
<<<<<<< Updated upstream
import 'package:sheta_store/features/favorite/presentation/cubit/wishlist_cubit.dart';
=======
import 'package:sheta_store/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:sheta_store/firebase_options.dart';
>>>>>>> Stashed changes

import 'features/auth/presentation/cubit/auth_cubit.dart';

import 'dart:async';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  await Future.wait([
    setupFlutterNotifications(),
    configureDependencies(),
  ]);
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState(){
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showFlutterNotification(message);
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GlobalLoaderOverlay(
          overlayColor: AppColors.overlay,
          overlayWidgetBuilder:
              (progress) => Center(
                child: CircularProgressIndicator(color: AppColors.main),
              ),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<AuthCubit>()),
              BlocProvider(create: (context) => getIt<CartCubit>()),
              BlocProvider(create: (context) => getIt<CategoriesCubit>()),
            ],
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Sheta store',
              theme: AppTheme.myTheme,
              routerConfig: RoutesGenerator.getRoute,
            ),
          ),
        );
      },
    );
  }
}
