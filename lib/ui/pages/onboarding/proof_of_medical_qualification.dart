import 'package:flutter/material.dart';
import 'package:medicon/ui/components/buttons.dart';
import 'package:medicon/ui/components/custom_scaffold.dart';
import 'package:medicon/ui/components/custom_textfield.dart';
import 'package:medicon/ui/components/horizontal_dividers.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/components/upload_file.dart';
import 'package:medicon/ui/pages/auth/create_new_account.dart';
import 'package:medicon/ui/pages/auth/forgot_password.dart';
import 'package:medicon/ui/pages/onboarding/select_country.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:medicon/ui/utils/router.dart';
import 'package:medicon/utils/router.dart';


class ProofOfMedicalQualificationScreen extends StatefulWidget {

  final String groupName;

  const ProofOfMedicalQualificationScreen(this.groupName,
  {super.key});
  @override
  _ProofOfMedicalQualificationScreenState createState() => _ProofOfMedicalQualificationScreenState();
}

class _ProofOfMedicalQualificationScreenState extends State<ProofOfMedicalQualificationScreen> {

  TextEditingController yearOfMedicalQualification = TextEditingController();
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
          SizedBox(height: 50.h),
          regularText(
            'In what year did you qualify to practice medicine?',
            fontSize: 14.sp,
            textAlign: TextAlign.start,
            color: AppColors.textBlack,
            fontWeight:  FontWeight.w400,
          ),
          SizedBox(height: 20.h),
          CustomTextField(
            hintText: 'Year of Medical Qualification',
            controller: yearOfMedicalQualification,
            // maxLength: 11,
            // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            textInputAction: TextInputAction.done,
          ),
          SizedBox(height: 20.h),
          regularText(
            'Please upload medical qualification\n(Certificate of qualification)',
            fontSize: 14.sp,
            textAlign: TextAlign.start,
            color: AppColors.textBlack,
            fontWeight:  FontWeight.w400,
          ),
          SizedBox(height: 30.h),
          regularText(
            'Upload in PDF or Doc',
            fontSize: 14.sp,
            textAlign: TextAlign.start,
            color: AppColors.textBlack,
            fontWeight:  FontWeight.w200,
          ),
          SizedBox(height: 10.h),
          UploadFileCard(
            onTap: () {

            }
          ),
           SizedBox(height: 20.h),
          buttonWithBorder(
            'Submit',
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