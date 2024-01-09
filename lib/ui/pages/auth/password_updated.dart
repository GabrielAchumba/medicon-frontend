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

class PasswordUpdated extends StatefulWidget {

  const PasswordUpdated({super.key});
  @override
  _PasswordUpdatedState createState() => _PasswordUpdatedState();
}

class _PasswordUpdatedState extends State<PasswordUpdated> {


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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            regularText(
              'Pass',
              fontSize: 20.sp,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            SizedBox(height: 30.h),
            regularText(
              'Your password has been set up successfully.',
              fontSize: 13.sp,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w200,
              color: AppColors.textBlack,
            ),
            SizedBox(height: 60.h),
            buttonWithBorder('Proceed to Sign in',
              buttonColor: AppColors.darkGreen,
              fontSize: 15.sp,
              height: 56.h,
              textColor: AppColors.white,
              fontWeight: FontWeight.w600, onTap: () {

              },
            ),
            SizedBox(height: 20.h),

          ],
        ),
      ),
    );
  }

}
