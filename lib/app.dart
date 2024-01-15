import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicon/services/api_services/api_provider.dart';
import 'package:medicon/services/auth_services/auth_provider.dart';
import 'package:medicon/services/common/file_storage_service.dart';
import 'package:medicon/services/unique/user_service.dart';
import 'package:medicon/ui/pages/auth/splash_view.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  // final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => AuthServices(),
              ),  
              ChangeNotifierProvider(
                create: (context) => ApiProvider(),
              ), 
              ChangeNotifierProvider(
                create: (context) => UserService(),
              ),
              ChangeNotifierProvider(
                create: (context) => FileStorageServices(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Medicon',
              theme: ThemeData(
                textTheme: GoogleFonts.rubikTextTheme(Theme.of(context).textTheme),
                primaryColor: Colors.white,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              // home: SelectCategoryView(),
              home: const SplashView(),
            ),
          );
        });
  }
}