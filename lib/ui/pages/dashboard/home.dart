/* import 'package:cafia/ui/pages/accounts/search_cities.dart';
import 'package:cafia/ui/pages/auth/policy.dart';
import 'package:cafia/ui/pages/auth/terms_and_conditions.dart';
import 'package:cafia/ui/pages/auth/verify_view.dart';
import 'package:cafia/ui/pages/home/dashboard_view.dart';
import 'package:cafia/ui/pages/home/main_layout.dart'; */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicon/services/auth_services/auth_provider.dart';
import 'package:medicon/ui/components/apointment_card.dart';
import 'package:medicon/ui/components/buttons.dart';
import 'package:medicon/ui/components/custom_scaffold.dart';
import 'package:medicon/ui/components/custom_textfield.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../../utils/router.dart';

class HomeScreen extends StatefulWidget {

  final String fullName;

  const HomeScreen({super.key, required this.fullName});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  bool isLoading = false;

  bool accept = false;
  bool removeImage = true;
  bool removeBack = true;
  int _index = 0;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      removeImage: removeImage,
      removeBack: removeBack,
      title: '',
      child: Container(
        padding: EdgeInsets.all(20.h),
        child: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [ 
              Row(
                children: [
                  InkWell(
                    onTap: () => setState(() => accept = !accept),
                    child: Container(
                      height: 60.h,
                      width: 60.h,
                      decoration: BoxDecoration(
                        color: accept ? AppColors.darkGreen : null,
                        borderRadius: BorderRadius.circular(30.h),
                      ),
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
              SizedBox(height: 20.h),
              Stack(
                children:[
                  PageView.builder(
                      controller: controller,
                      onPageChanged: (value){
                        _index = value;
                        setState(() {});
                      },
                      itemCount: items().length,
                      itemBuilder: (context, index){
                        print(index);
                        return Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text('SE ME'),
                        );
                      }
                    ),
                  SizedBox(height: 10.h),
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
                ]
              ),
              ],
          ),
        ),
      ),
    );
  }

}

class Item {
  String patientFullName;
  String patientProfilePic;
  String appointmentDate;
  String appointmentTime;

  Item({required this.patientFullName,
  required this.patientProfilePic,
  required this.appointmentDate,
  required this.appointmentTime});
}

List<Item> items() {
  return [
    Item(
      patientFullName: 'Ikechukwu Okeke',
      patientProfilePic: 'https://cdn.quasar.dev/img/mountains.jpg',
      appointmentDate: '09-01-2024',
      appointmentTime: "10:00AM - 11:00AM"
    ),
    Item(
      patientFullName: 'Martins Abiola',
      patientProfilePic: 'https://cdn.quasar.dev/img/parallax1.jpg',
      appointmentDate: '11-01-2024',
      appointmentTime: "9:00AM - 10:00AM"
    ),
    Item(
      patientFullName: 'Musa Lawal',
      patientProfilePic: 'https://cdn.quasar.dev/img/quasar.jpg',
      appointmentDate: '15-01-2024',
      appointmentTime: "01:00PM - 02:00PM"
    ),
  ];
}