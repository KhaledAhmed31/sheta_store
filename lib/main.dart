import 'package:flutter/material.dart';
import 'package:sheta_store/common/routes/routes_generator.dart';
import 'package:sheta_store/splash/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sheta store',
          home: SplashScreen(),
          onGenerateRoute: RoutesGenerator.getRoute,
        );
      },
    );
  }
}
