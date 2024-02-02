import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:medicon/ui/components/apointment_card.dart';
import 'package:medicon/ui/components/custom_textfield.dart';
import 'package:medicon/ui/components/buttons.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/pages/auth/create_new_account.dart';
import 'package:medicon/ui/pages/auth/login.dart';
//import 'package:namer2/ui/pages/auth/login.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:medicon/ui/utils/router.dart';
import 'package:medicon/utils/router.dart';

class HomeScreen extends StatefulWidget {

  final String fullName;
  const HomeScreen({super.key, required this.fullName});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  PageController controller = PageController();
  bool isAvaliability = false;

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
                              children: [
                                InkWell(
                                  onTap: () => setState(() => {}),
                                  child: Container(
                                    height: 60.h,
                                    width: 60.h,
                                    child: CircleAvatar(
                                      radius: 30.h,
                                      backgroundImage: NetworkImage(
                                          'https://cdn.quasar.dev/img/parallax2.jpg'
                                        ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.h),
                                Expanded(
                                  child: RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      text: 'Good Morning\n',
                                      style: GoogleFonts.rubik(
                                        color: AppColors.textBlack,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: ' ${widget.fullName} ',
                                            style: GoogleFonts.rubik(
                                              color: AppColors.black,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                        )),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children:[
                            regularText(
                              'You have ',
                              fontSize: 15.sp,
                              textAlign: TextAlign.start,
                              fontWeight:  FontWeight.w400,
                              color: AppColors.textBlack
                            ),
                            regularText(
                              '3 pending appointment',
                              fontSize: 15.sp,
                              textAlign: TextAlign.start,
                              fontWeight:  FontWeight.w400,
                              color: AppColors.darkGreen
                            ),
                            Expanded(
                              child: Text(''),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: AppColors.darkGreen
                            )
                          ]
                        ),
                        SizedBox(height: 20.h),
                        AppointmentCard(
                          patientFullName: items()[index].patientFullName,
                          patientProfilePic: items()[index].patientProfilePic,
                          appointmentDate: items()[index].appointmentDate,
                          appointmentTime: items()[index].appointmentTime,
                          description: "Pending appointment"
                        ),
                        SizedBox(height: 20),
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
                                  SizedBox(height: 20.h),
                                ]
                              ),
                            ),
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
                        padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 15.h),
                        decoration: BoxDecoration(
                          color:  AppColors.grey,
                          borderRadius: BorderRadius.circular(5.h),
                        ),
                        child:Row(
                          children: [
                            regularText(
                              'I am available',
                              fontSize: 14.sp,
                            textAlign: TextAlign.start,
                            fontWeight:  FontWeight.w300,
                              color: AppColors.textBlack
                            ),
                            Expanded(child:Text('')),
                            FlutterSwitch(
                                  height: 20.0,
                                  width: 40.0,
                                  padding: 4.0,
                                  toggleSize: 15.0,
                                  borderRadius: 10.0,
                                  activeColor: AppColors.darkGreen,
                                  value: isAvaliability,
                                  onToggle: (value) {
                                        setState(() {
                                              isAvaliability = value;
                                              print(isAvaliability);
                                        });
                                  },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 15.h),
                        decoration: BoxDecoration(
                          color:  AppColors.grey,
                          borderRadius: BorderRadius.circular(5.h),
                        ),
                        child:Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: AppColors.darkGreen,
                              size: 30.h,
                            ),
                            SizedBox(width: 10.h),
                            regularText(
                              'Schedule appointment',
                              fontSize: 14.sp,
                            textAlign: TextAlign.start,
                            fontWeight:  FontWeight.w300,
                              color: AppColors.textBlack
                            ),
                            Expanded(child:Text('')),
                            Icon(
                              Icons.arrow_forward,
                              color: AppColors.darkGreen,
                              size: 30.h,
                            ),
                            SizedBox(width: 10.h),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 15.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.h),
                        ),
                        child:Row(
                          children: [
                            Text(
                              'Recent Consulations',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                backgroundColor: AppColors.white,
                                color: AppColors.black
                              ),

                            ),
                            Expanded(child:Text('')),
                          ],
                        ),
                      ),
                      SizedBox(height: 80.h),
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
  String patientFullName;
  String patientProfilePic;
  String appointmentDate;
  String appointmentTime;
  bool isGallery;
  String description;
  String? appointmentNumber;

  Item({required this.patientFullName,
  required this.patientProfilePic,
  required this.appointmentDate,
  required this.appointmentTime,
  required this.isGallery,
  required this.description,
  this.appointmentNumber = ""});
}

List<Item> items() {
  return [
    Item(
      patientFullName: 'Ikechukwu Okeke',
      patientProfilePic: 'https://cdn.quasar.dev/img/mountains.jpg',
      appointmentDate: '09-01-2024',
      appointmentTime: "10:00AM - 11:00AM",
      isGallery: true,
      description: "Pending appointment"
    ),
    Item(
      patientFullName: 'Martins Abiola',
      patientProfilePic: 'https://cdn.quasar.dev/img/parallax1.jpg',
      appointmentDate: '11-01-2024',
      appointmentTime: "9:00AM - 10:00AM",
      isGallery: true,
      description: "Pending appointment"
    ),
    Item(
      patientFullName: 'Musa Lawal',
      patientProfilePic: 'https://cdn.quasar.dev/img/quasar.jpg',
      appointmentDate: '15-01-2024',
      appointmentTime: "01:00PM - 02:00PM",
      isGallery: true,
      description: "Pending appointment"
    ),
  ];
}

List<Item> recentConsultations() {
  return [
    Item(
      patientFullName: 'Samuel Ayinla',
      patientProfilePic: 'https://cdn.quasar.dev/img/mountains.jpg',
      appointmentDate: '09-01-2024',
      appointmentTime: "10:00AM - 11:00AM",
      isGallery: true,
      description: "Patient . Male . 43",
      appointmentNumber: "APT00457"
    ),
    Item(
      patientFullName: 'Martins Abiola',
      patientProfilePic: 'https://cdn.quasar.dev/img/parallax1.jpg',
      appointmentDate: '11-01-2024',
      appointmentTime: "9:00AM - 10:00AM",
      isGallery: true,
      description: "Patient . Female . 35",
      appointmentNumber: "APT00257"
    ),
    Item(
      patientFullName: 'Musa Lawal',
      patientProfilePic: 'https://cdn.quasar.dev/img/quasar.jpg',
      appointmentDate: '15-01-2024',
      appointmentTime: "01:00PM - 02:00PM",
      isGallery: true,
      description: "Patient . Male . 28",
      appointmentNumber: "APT00487"
    ),
  ];
}