import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicon/services/auth_services/auth_provider.dart';
import 'package:medicon/ui/components/buttons.dart';
import 'package:medicon/ui/components/custom_scaffold.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/pages/auth/login.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:medicon/utils/router.dart';
import 'package:provider/provider.dart';


class TermsOfService extends StatefulWidget {
  const TermsOfService({
    super.key,
  });
  @override
  _TermsOfServiceState createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {

  bool accept = false;
  bool removeImage = true;
  
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: '',
      removeImage: removeImage,
      child: ListView(
        padding: EdgeInsets.all(20.h),
        children: [
          regularText(
            'Terms of service',
            fontSize: 25.sp,
            textAlign: TextAlign.start,
            fontWeight:  FontWeight.w600,
            color: AppColors.black
          ),
          SizedBox(height: 10.h),
          regularText(
            'To continue, please accept our terms of service',
            fontSize: 14.sp,
            textAlign: TextAlign.start,
            color: AppColors.textBlack,
            fontWeight: FontWeight.w400
          ),
          SizedBox(height: 30.h),
          regularText(
            termsOfService,
            fontSize: 13.sp,
            textAlign: TextAlign.start,
            color: AppColors.textBlack,
            fontWeight: FontWeight.w200,
          ),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  InkWell(
                onTap: () => setState(() => accept = !accept),
                child: Container(
                  height: 20.h,
                  width: 20.h,
                  decoration: BoxDecoration(
                    color: accept ? AppColors.darkGreen : null,
                    //borderRadius: BorderRadius.circular(10.h),
                    border: Border.all(
                      width: 3.h,
                      color: const Color(0xffD0D5DD),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.h),
                  const Text(
                    'I agree with all terms of service',
                    style: TextStyle(color: AppColors.textBlack, fontWeight: FontWeight.w300, fontSize: 13),
                  ),
                ],
              ),
              Expanded(
                child: Text(''),
              ),
            ]
          ),
          SizedBox(height: 60.h),
          Consumer<AuthServices>(builder: (ctx, authProvider, child) {
            return buttonWithBorder(
              'Agree',
              buttonColor: AppColors.darkGreen,
              fontSize: 15.sp,
              height: 56.h,
              //busy: authProvider.isLoading,
              textColor: AppColors.white,
              fontWeight: FontWeight.w300,
              onTap: () {
                
              },
            ); 
          }),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  String termsOfService = "Sample: If you're not old enough to manage your own Goole Account, you need permission from your parent or legal guardian to use one. We ask that your parent or legal guardian read these terms with you.\nIf you're a parent or legal guardian and you give permission for your child to use our services, then these terms apply to you. You're responsible for your child's activity on our services.\nPlease not that some Google services may have additional age requirements outlined in their service-specific additional terms and policies.";
}