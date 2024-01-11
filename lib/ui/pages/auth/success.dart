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
import 'package:medicon/ui/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../../utils/router.dart';
import 'login.dart';

class SuccessScreen extends StatefulWidget {

  final String email;

  const SuccessScreen(this.email, 
  {super.key});
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
            SizedBox(height: 50.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.h),
              child: Image.asset(
                  'assets/images/lock.jpg',
                  width: 310.h),
            ),
            SizedBox(height: 30.h),
            regularText(
              'Success',
              fontSize: 20.sp,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            SizedBox(height: 30.h),
            regularText(
              'Your account has been successfully created, proceed to verification.',
              fontSize: 13.sp,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w200,
              color: AppColors.textBlack,
            ),
            SizedBox(height: 60.h),
            Consumer<AuthServices>(builder: (ctx, authProvider, child) {
              return buttonWithBorder(
                'Proceed to verification',
                buttonColor: AppColors.darkGreen,
                fontSize: 15.sp,
                height: 56.h,
                //busy: authProvider.isLoading,
                textColor: AppColors.white,
                fontWeight: FontWeight.w300,
                onTap: () {
                  authProvider.sendOTPToEmail(
                      context: ctx,
                      email: widget.email,
                      isResend: false,
                    );
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
