import 'package:flutter/material.dart';
import 'package:medicon/ui/components/buttons.dart';
import 'package:medicon/ui/components/custom_scaffold.dart';
import 'package:medicon/ui/components/custom_textfield.dart';
import 'package:medicon/ui/components/horizontal_dividers.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/pages/auth/create_new_account.dart';
import 'package:medicon/ui/pages/auth/forgot_password.dart';
import 'package:medicon/ui/pages/onboarding/select_country.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:medicon/ui/utils/router.dart';
import 'package:medicon/utils/router.dart';


class WelcomeScreen extends StatefulWidget {

  final String fullName;

  const WelcomeScreen(this.fullName,
  {super.key});
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  bool removeImage = true;
  bool removeBack = true;

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
            'Welcome ${widget.fullName}',
            fontSize: 25.sp,
            textAlign: TextAlign.start,
            fontWeight:  FontWeight.w600,
            color: AppColors.black
          ),
          SizedBox(height: 10.h),
          regularText(
            'Click continue to proceed',
            fontSize: 13.sp,
            textAlign: TextAlign.start,
            color: AppColors.textBlack
          ),
          SizedBox(height: 150.h),
          regularText(
            'Your Telehealth practice is almost ready! The next step is to upload relevant documents for verification. Tap on Continue to begin',
            fontSize: 13.sp,
            textAlign: TextAlign.start,
            color: AppColors.textBlack
          ),
          SizedBox(height: 30.h),
          buttonWithBorder(
            'Continue',
            buttonColor: AppColors.darkGreen,
            fontSize: 15.sp,
            height: 56.h,
            //busy: authProvider.isLoading,
            textColor: AppColors.white,
            fontWeight: FontWeight.w300,
            onTap: () {
              nextPage(context, page: const SelectCountryScreen());
            },
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}