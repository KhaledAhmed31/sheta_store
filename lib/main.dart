
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'core/dependency_injection/identifiers.dart';
import 'core/notificaton%20service/notification_service.dart';
import 'core/routes/routes_generator.dart';
import 'core/ui/app_colors.dart';
import 'core/ui/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';

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
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Sheta store',
            theme: AppTheme.myTheme,
            routerConfig: RoutesGenerator.getRoute,
          ),
        );
      },
    );
  }
}
