import 'package:medicon/ui/components/floating_navbar.dart';
import 'package:medicon/ui/pages/dashboard/home2.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:medicon/services/user_services/user_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainLayout extends StatefulWidget {

  final String fullName;
  const MainLayout({super.key, required this.fullName});

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  bool profilePic = false;
  String? username;
  String? location;
  String? bio;
  String? email;
  String? phone;
  @override
  void initState() {
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Consumer<UserService>(
      builder: (context, provider, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: provider.isLoadingProfile
              ? const SplashScreen()
              : FloatingNavBar(
                      items: [
                        FloatingNavBarItem(
                            img: 'home', 
                            page: HomeScreen2(fullName: "Gabriel Achumba")
                          ),
                       /*  FloatingNavBarItem(
                            img: 'home', page: HomeScreen2(fullName: "Gabriel Achumba")), */
                        FloatingNavBarItem(img: 'message', page: const Placeholder()),
                        FloatingNavBarItem(img: 'main-add', page: const Placeholder()),
                        FloatingNavBarItem(img: 'notification', page: const Placeholder()),
                        FloatingNavBarItem(
                          img: 'profile',
                          page: const Placeholder(),
                        ),
                      ],
                    ),
        );
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF1E2),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/splash.png'), fit: BoxFit.cover),
        ),
        child: Image.asset(
          'assets/images/logo.png',
          height: 128.h,
          width: 128.h,
        ),
      ),
    );
  }
}