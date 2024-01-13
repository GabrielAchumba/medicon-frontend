import 'package:flutter/material.dart';
import 'package:medicon/models/external_file.dart';
import 'package:medicon/ui/components/buttons.dart';
import 'package:medicon/ui/components/custom_scaffold.dart';
import 'package:medicon/ui/components/custom_textfield.dart';
import 'package:medicon/ui/components/horizontal_dividers.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/components/user_detail_card.dart';
import 'package:medicon/ui/pages/auth/create_new_account.dart';
import 'package:medicon/ui/pages/auth/forgot_password.dart';
import 'package:medicon/ui/pages/onboarding/proof_of_medical_qualification.dart';
import 'package:medicon/ui/pages/onboarding/select_country.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:medicon/ui/utils/router.dart';
import 'package:medicon/utils/router.dart';


class UserDetailsScreen extends StatefulWidget {

  final String country;
  final String userType;

  const UserDetailsScreen(this.country,
  this.userType,
  {super.key});
  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {

  bool removeImage = true;
  bool removeBack = true;
  int _index = -1;
  List<NotVerifiedProfile> pendingVerificationProfiles = [];
  List<NotVerifiedProfile> notVerifiedProfiles = [
    NotVerifiedProfile(
      title: 'Proof of medical qualification',
      iconColor: Colors.blueAccent,
      iconData: Icons.access_alarm_outlined,
      isActive: false,
      isPendingVerification: false
    ),
    NotVerifiedProfile(
      title: 'Full Medical Registration',
      iconColor: Colors.redAccent,
      iconData: Icons.person_2_outlined,
      isActive: false,
      isPendingVerification: false
    ),
    NotVerifiedProfile(
      title: 'Current Year License',
      iconColor: Colors.orangeAccent,
      iconData: Icons.lightbulb_outline,
      isActive: false,
      isPendingVerification: false
    ),
    NotVerifiedProfile(
      title: 'Additional Certificates',
      iconColor: Colors.orangeAccent,
      iconData: Icons.lightbulb_outline,
      isActive: false,
      isPendingVerification: false
    ),
    NotVerifiedProfile(
      title: 'Identity Verification',
      iconColor: Colors.redAccent,
      iconData: Icons.perm_identity_outlined,
      isActive: false,
      isPendingVerification: false
    ),
    NotVerifiedProfile(
      title: 'Current Employment',
      iconColor: Colors.greenAccent,
      iconData: Icons.badge_outlined,
      isActive: false,
      isPendingVerification: false
    ),
  ];
  List<String> fileGroupIds =  [];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: '',
      removeBack: removeBack,
      removeImage: removeImage,
      child: ListView(
        padding: EdgeInsets.all(20.h),
        children: [
          regularText(
            'Verify My Account General List',
            fontSize: 25.sp,
            textAlign: TextAlign.start,
            fontWeight:  FontWeight.w600,
            color: AppColors.black
          ),
          SizedBox(height: 10.h),
          regularText(
            'Verify my details as a general practitioner',
            fontSize: 13.sp,
            textAlign: TextAlign.start,
            color: AppColors.textBlack
          ),
          SizedBox(height: 40.h),
          Container(
            height: 20.h,
            margin: EdgeInsets.only(bottom: 10.h),
            child: Row(
              children: [
                ListView.builder(
                  itemCount: notVerifiedProfiles.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          width: 60.h,
                          height: 6.h,
                          duration: const Duration(seconds: 1),
                          decoration: BoxDecoration(
                            color: index  < _index ? 
                            AppColors.darkGreen :
                            AppColors.textBlack,
                          ),
                          padding: EdgeInsets.all(4.h),
                        ),
                      ],
                    );
                  }
                ),
                SizedBox(width: 10.h),
                regularText(
                  pendingVerificationProfiles.length == 0 ? '':
                   pendingVerificationProfiles.length > notVerifiedProfiles.length ? 
                  '${notVerifiedProfiles.length}/${notVerifiedProfiles.length}':
                  '${pendingVerificationProfiles.length}/${notVerifiedProfiles.length}',
                  fontSize: 13.sp,
                  textAlign: TextAlign.start,
                  color: AppColors.textBlack
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          ListView.builder(
                itemCount: notVerifiedProfiles.length,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                //padding: EdgeInsets.only(top: 10.h, bottom: 100.h),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      UserDetailCard(
                        title: notVerifiedProfiles[index].title,
                        iconData: notVerifiedProfiles[index].iconData,
                        iconColor:notVerifiedProfiles[index].iconColor,
                        cardColor: AppColors.grey,
                        cardBorderColor: AppColors.textBlack,
                        onTap: () async {
                          pendingVerificationProfiles.add(notVerifiedProfiles[index]);
                          _index = pendingVerificationProfiles.length;
                          for(var i = 0; i < notVerifiedProfiles.length; i++){
                            notVerifiedProfiles[i].isActive = false;
                          }
                          notVerifiedProfiles[index].isActive = true;
                          notVerifiedProfiles[index].isPendingVerification = true;

                          switch(notVerifiedProfiles[index].title){
                            case 'Proof of medical qualification':
                              GrouppedExternalFiles? res = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProofOfMedicalQualificationScreen(
                                  notVerifiedProfiles[index].title
                                  ),
                                ),
                              );
                              if (res != null) {
                                if(fileGroupIds.contains(res.groupId)){
                                  fileGroupIds.add(res.groupId);
                                }
                              }
                              setState(() {});
                          }
                        },
                        isActive: notVerifiedProfiles[index].isActive,
                        isPendingVerification: notVerifiedProfiles[index].isPendingVerification,
                      ),
                      SizedBox(height: 20.h),
                    ],
                  );
                },
          ),
          buttonWithBorder(
            'Submit for verification',
            buttonColor: AppColors.darkGreen,
            fontSize: 15.sp,
            height: 56.h,
            textColor: AppColors.white,
            fontWeight: FontWeight.w300,
            onTap: () {
              nextPage(context, page: const Placeholder());
            },
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}


class NotVerifiedProfile {
  String title;
  Color iconColor;
  IconData iconData;
  bool isActive;
  bool isPendingVerification;

  NotVerifiedProfile({required this.title,
  required this.iconColor,
  required this.iconData,
  required this.isActive,
  required this.isPendingVerification});
}