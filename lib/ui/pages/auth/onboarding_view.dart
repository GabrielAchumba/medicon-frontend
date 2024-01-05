import 'package:flutter/material.dart';
import 'package:medicon/ui/components/buttons.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/pages/auth/create_new_account.dart';
import 'package:medicon/ui/pages/auth/login.dart';
//import 'package:namer2/ui/pages/auth/login.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:medicon/ui/utils/router.dart';
import 'package:medicon/utils/router.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
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
                            child: const Text(
                              "Medicon",
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 16,
                                //fontWeight: FontWeight.w600,
                              ),
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.h),
                          child: Image.asset(
                              'assets/images/onboard$_index.gif',
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
                        'Login to your account',
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
                        'Sign up your account',
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
