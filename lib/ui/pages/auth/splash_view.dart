import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:medicon/ui/pages/auth/onboarding_view.dart';
import 'package:medicon/ui/pages/onboarding/welcome.dart';
import 'package:medicon/ui/utils/colors.dart';
//import 'package:namer2/ui/pages/home/main_layout.dart';
import 'package:medicon/ui/utils/router.dart';
import 'package:medicon/utils/router.dart';
import 'package:medicon/ui/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  String? mtoken = "";
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      }
    );

    hasAccount();
    super.initState();
  }

  void hasAccount() async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    String? token = sf.getString("token");
    String? fullName = sf.getString("fullName");
    print(token);
    
    //nextPage(context, page: const OnboardingView());
    if(token == null || token == ""){
      nextPage(context, page: const OnboardingView());
    }
    else{
      //pushReplacement(context, const MainLayout());
      nextPageOnly(context, page:  WelcomeScreen(fullName!));
    }
  }

  void requestPermission() async {
    //
    // NotificationSettings settings = await messaging.requestPermission(
    //   alert: true,
    //   announcement: false,
    //   badge: true,
    //   carPlay: false,
    //   criticalAlert: false,
    //   provisional: false,
    //   sound: true,
    // );
    // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    //   print("Granted Permission");
    // } else if (settings.authorizationStatus ==
    //     AuthorizationStatus.provisional) {
    //   print("user granted provisional permission");
    // } else {
    //   print("user declined");
    // }
  }

  /* void sendPushMessage(String token) async {
    try {
      await http.post(Uri.parse("https://fcm.googleapis.com/fcm/send"),
          headers: <String, String>{
            'Content-Type': "Application/json",
            "Authorization":
            "key=AAAAhOk1FdQ:APA91bHY9jNAxUooYYsUHlSc0DeI549zR6VwzmG-kviZHrwh779Yv1IAOoHOPwWwSYOMpBe96VtIzD-Pv4KVLUDk7NyE_73dqve0XBuCzS1rr7bX1jlJ8lhJZhq3nVipRiJ2jAT_qnlj"
          },
          body: jsonEncode(<String, dynamic>{
            'notification': <String, dynamic>{
              'body': 'Hello Cafia User',
              'title': 'Incoming Call'
            },
            'priority': "high",
            'data': <String, dynamic>{
              'Click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'status': 'done',
              'body': 'Hie',
              'title': 'this is a title'
            },
            'to': token
          }));
      print('sent');
    } catch (e) {
      print("cant send a notification");
    }
  } */

  // void getTokenFromFirestore() async {}
  // void getToken() async {
  //   await FirebaseMessaging.instance.getToken().then((token) {
  //     setState(() {
  //       mtoken = token;
  //     });
  //     saveToken(token!);
  //   });
  // }
  //
  // void saveToken(String token) async {
  //   await FirebaseFirestore.instance
  //       .collection("UsersToken")
  //       .doc('Device')
  //       .set({"Token": token});
  // }

  @override
  Widget build(BuildContext context) {
    Utils.offKeyboard();
    return Scaffold(
      backgroundColor: const Color(0xffFFF1E2),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: AppColors.white,
         /*  image: DecorationImage(
              image: AssetImage('assets/images/splash.png'), fit: BoxFit.cover), */
        ),
        child: Row(
          crossAxisAlignment : CrossAxisAlignment.center,
          children: [
            Expanded(child: Text(''),),
            Image.asset(
              'assets/images/logo.png',
              //height: 150.h,
              //width: 150.h,
            ),
            const Text(
              "Medicon",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 16,
                //fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(child: Text(''),),
          ],
        ),
      ),
    );
  }
}