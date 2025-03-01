import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sheta_store/core/DI/auth_data_identifiers.dart';
import 'package:sheta_store/core/routes/routes_generator.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/features/splash/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/auth/presentation/cubit/sign_in_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
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
        return GlobalLoaderOverlay(
          overlayColor: AppColors.overlay,
          overlayWidgetBuilder: (progress) => Center(
            child: CircularProgressIndicator(
              color: AppColors.main,
            ),
          ),
          child: BlocProvider<AuthCubit>(
            create: (context) => getIt<AuthCubit>(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Sheta store',
              home: SplashScreen(),
              onGenerateRoute: RoutesGenerator.getRoute,
            ),
          ),
        );
      },
    );
  }
}
