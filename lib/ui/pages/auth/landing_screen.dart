import 'package:flutter/material.dart';
import 'package:medicon/ui/components/buttons.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/pages/auth/create_new_account.dart';
import 'package:medicon/ui/pages/auth/login.dart';
//import 'package:namer2/ui/pages/auth/login.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:medicon/ui/utils/router.dart';
import 'package:medicon/utils/router.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _index = 0;

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        child: SafeArea(
          child: Stack(
            children: [
              PageView.builder(
                controller: controller,
                onPageChanged: (value){
                  _index = value;
                  setState(() {});
                },
                itemCount: items().length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {

                            },
                            child: Row(
                              //crossAxisAlignment : CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                              'assets/images/logo.png'),
                                const Text(
                                  "Medicon",
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 16,
                                    //fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.topLeft,
                          child: regularText(
                            items()[index].title,
                            fontSize: 30.sp,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: 50),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.h),
                          child: Image.asset(
                              'assets/images/onboard$_index.png',
                              width: 310.h),
                        ),
                      ],
                    ),
                  );
                }
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                          bottom: 20.h, right: 30.h, left: 30.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 20.h,
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: ListView.builder(
                          itemCount: items().length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AnimatedContainer(
                                  width: _index == index ? 18.h : 6.h,
                                  height: 6.h,
                                  duration: const Duration(seconds: 1),
                                  margin: EdgeInsets.all(2.h),
                                  decoration: BoxDecoration(
                                    color: _index == index
                                          ? AppColors.darkGreen
                                          : AppColors.darkGreen
                                              .withOpacity(.5),
                                      borderRadius: 
                                          BorderRadius.circular(30.h),
                                  ),
                                  padding: EdgeInsets.all(
                                    _index == index ? 0 : 4.h
                                  ),
                                ),
                              ],
                            );
                          }
                        ),
                      ),
                      buttonWithBorder(
                        buttonItems()[_index].up,
                        buttonColor: AppColors.darkGreen,
                        fontSize: 15.sp,
                        height: 56.h,
                        //busy: authProvider.isLoading,
                        textColor: AppColors.white,
                        fontWeight: FontWeight.w300,
                        onTap: () {
                          if (_index == 2) {
                            pushReplacement(context, const LoginScreen());
                          } else {
                            controller.nextPage(
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut);
                          }
                        },
                      ),
                      SizedBox(height: 20.h),
                      buttonWithBorder(
                        buttonItems()[_index].down,
                        buttonColor: AppColors.lightGrey,
                        fontSize: 15.sp,
                        height: 56.h,
                        //busy: authProvider.isLoading,
                        textColor: AppColors.black,
                        fontWeight: FontWeight.w300,
                        onTap: () {
                          if (_index == 2) {
                            pushReplacement(context, const CreateNewAccount());
                          } else {
                            controller.nextPage(
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut);
                          }
                        },
                      ),
                      SizedBox(height: 20.h)
                    ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonItem {
  String up;
  String down;

  ButtonItem({required this.up,
  required this.down});
}
List<ButtonItem> buttonItems() {
  return [
    ButtonItem(
      up: 'Next',
      down: 'Skip'
    ),
    ButtonItem(
      up: 'Next',
      down: 'Skip'
    ),
    ButtonItem(
      up: 'Login to your account',
      down: 'Sign up your account'
    ),
  ];
}

class Item {
  String title;

  Item({required this.title});
}

List<Item> items() {
  return [
    Item(
      title: 'Health check and\nConsultation easily\nanywhere and\nanytime'
    ),
    Item(
      title: 'Thousand of\nDoctors and Expert\nto help with your\nHealth needs'
    ),
    Item(
      title: 'Make Online And\nLive Consultation\nEasily With Top Doctors'
    ),
  ];
}
