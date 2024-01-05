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

class ResetPassword extends StatefulWidget {
  final bool isLogin;
  const ResetPassword({super.key, this.isLogin = false});
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  String selectedCountry = "";
  bool isLoading = false;

  bool accept = false;
  @override
  void initState() {
    accept = widget.isLogin;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: '',
      child: Container(
        padding: EdgeInsets.all(20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: 30.h),
            regularText(
              'Create New Password',
              fontSize: 25.sp,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            SizedBox(height: 30.h),
            /* regularText(
              'Password',
              fontSize: 13.sp,
              textAlign: TextAlign.start,
              //fontWeight: FontWeight.w400,
              color: AppColors.textBlack,
            ), */
            //SizedBox(height: 10.h),
            CustomTextField(
              hintText: 'Password',
              controller: password,
              // maxLength: 11,
              // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textInputAction: TextInputAction.done,
            ),
            SizedBox(height: 20.h),
            /* regularText(
              ' Confirm Password',
              fontSize: 16.sp,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ), */
            //SizedBox(height: 10.h),
            CustomTextField(
              hintText: 'Confirm password',
              controller: confirmPassword,
              // maxLength: 11,
              // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textInputAction: TextInputAction.done,
            ),
            SizedBox(height: 40.h),
            Consumer<AuthServices>(
              builder: (context, provider, child) {
                return buttonWithBorder('Create New Password',
                    buttonColor: AppColors.darkGreen,
                    fontSize: 15.sp,
                    height: 56.h,
                    textColor: AppColors.white,
                    fontWeight: FontWeight.w600, onTap: () {

                      nextPage(context, page: const LoginScreen());
                    }
                );
              }
            ),
            SizedBox(height: 20.h),

          ],
        ),
      ),
    );
  }

}
