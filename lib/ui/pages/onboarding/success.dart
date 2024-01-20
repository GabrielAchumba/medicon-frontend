/* import 'package:cafia/ui/pages/accounts/search_cities.dart';
import 'package:cafia/ui/pages/auth/policy.dart';
import 'package:cafia/ui/pages/auth/terms_and_conditions.dart';
import 'package:cafia/ui/pages/auth/verify_view.dart';
import 'package:cafia/ui/pages/home/dashboard_view.dart';
import 'package:cafia/ui/pages/home/main_layout.dart'; */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicon/services/auth_services/auth_provider.dart';
import 'package:medicon/ui/components/buttons.dart';
import 'package:medicon/ui/components/custom_scaffold.dart';
import 'package:medicon/ui/components/custom_textfield.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/pages/dashboard/dashboard.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../../utils/router.dart';

class SuccessScreen extends StatefulWidget {

  const SuccessScreen({super.key});
  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {


  bool isLoading = false;

  bool accept = false;
  bool removeImage = true;
  bool removeBack = true;
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            regularText(
              'Onboarding',
              fontSize: 25.sp,
              textAlign: TextAlign.start,
              fontWeight:  FontWeight.w600,
              color: AppColors.black
            ),
            SizedBox(height: 10.h),
            regularText(
              'Upload file from your computer',
              fontSize: 13.sp,
              textAlign: TextAlign.start,
              color: AppColors.textBlack,
              fontWeight:  FontWeight.w200,
            ),
            SizedBox(height: 20.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.h),
              child: Image.asset(
                  'assets/images/lock.jpg',
                  width: 310.h),
            ),
            SizedBox(height: 20.h),
            regularText(
              'Profile Created!',
              fontSize: 20.sp,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            SizedBox(height: 10.h),
            regularText(
              'Your profile was created successfully!',
              fontSize: 13.sp,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w200,
              color: AppColors.textBlack,
            ),
            SizedBox(height: 30.h),
            regularText(
              "To login into your account, we'll need to verify your information, but don't worry - we'll get back to you quickly. Stay tuned.",
              fontSize: 13.sp,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w200,
              color: AppColors.textBlack,
            ),
            SizedBox(height: 10.h),
            Consumer<AuthServices>(builder: (ctx, authProvider, child) {
              return buttonWithBorder(
                'I Understand',
                buttonColor: AppColors.darkGreen,
                fontSize: 15.sp,
                height: 56.h,
                //busy: authProvider.isLoading,
                textColor: AppColors.white,
                fontWeight: FontWeight.w300,
                onTap: () {
                  nextPage(context, page: const DasboardScreen());
                  /* authProvider.sendOTPToEmail(
                      context: ctx,
                      email: widget.email,
                      isResend: false,
                    ); */
                },
              ); 
            }),
            SizedBox(height: 20.h),

          ],
        ),
      ),
    );
  }

}