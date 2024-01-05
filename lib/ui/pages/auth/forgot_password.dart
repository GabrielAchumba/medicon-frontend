import 'package:flutter/material.dart';
import 'package:medicon/services/auth_services/auth_provider.dart';
import 'package:medicon/ui/components/buttons.dart';
import 'package:medicon/ui/components/custom_scaffold.dart';
import 'package:medicon/ui/components/custom_textfield.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/pages/auth/verify_view.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../../utils/router.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({
    super.key,
  });
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController country = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  String selectedCountry = "";

  bool accept = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      removeBack: true,
      title: '',
      child: ListView(
        padding: EdgeInsets.all(20.h),
        children: [
          SizedBox(height: 30.h),
          regularText(
            'Forgot your password?',
            fontSize: 25.sp,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          SizedBox(height: 10.h),
          regularText(
            'Type your email address and we will send the verification code',
            fontSize: 13.sp,
            textAlign: TextAlign.start,
            height: 1.8,
            color: AppColors.textBlack,
          ),
          SizedBox(height: 30.h),
          CustomTextField(
            hintText: 'Email Address ',
            controller: email,
            // maxLength: 11,
            // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            textInputAction: TextInputAction.done,
          ),
          SizedBox(height: 100.h),
          Consumer<AuthServices>(
            builder: (context, authProvider, child) {
              return buttonWithBorder(
                'Send reset code',
                buttonColor: AppColors.darkGreen,
                fontSize: 15.sp,
                height: 56.h,
                busy: authProvider.isLoading,
                textColor: AppColors.white,
                fontWeight: FontWeight.w600,
                onTap: () {
                  nextPage(context, page: VerifyView(email.text.trim()));
                  /* authProvider.forgotPassword(
                    context: context,
                    email: email.text.trim(),
                    isResend: false,
                  ); */
                },
              );
            },
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
