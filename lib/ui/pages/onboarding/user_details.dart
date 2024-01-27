import 'package:flutter/material.dart';
import 'package:medicon/models/additional_certificate_file.dart';
import 'package:medicon/models/current_employment_file.dart';
import 'package:medicon/models/current_year_license_file.dart';
import 'package:medicon/models/external_file.dart';
import 'package:medicon/models/identity_verification_file.dart';
import 'package:medicon/models/medical_qualification_file.dart';
import 'package:medicon/models/medical_registration_file.dart';
import 'package:medicon/models/specialty_certificate_file.dart';
import 'package:medicon/services/common/file_storage_service.dart';
import 'package:medicon/services/onboarding_services/onboarding_service.dart';
import 'package:medicon/ui/components/buttons.dart';
import 'package:medicon/ui/components/custom_scaffold.dart';
import 'package:medicon/ui/components/custom_textfield.dart';
import 'package:medicon/ui/components/horizontal_dividers.dart';
import 'package:medicon/models/file_payload_backend.dart';
import 'package:medicon/ui/components/snackbar.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/components/user_detail_card.dart';
import 'package:medicon/ui/pages/auth/create_new_account.dart';
import 'package:medicon/ui/pages/auth/forgot_password.dart';
import 'package:medicon/ui/pages/onboarding/additional_certificate.dart';
import 'package:medicon/ui/pages/onboarding/current_employment.dart';
import 'package:medicon/ui/pages/onboarding/current_year_license.dart';
import 'package:medicon/ui/pages/onboarding/identity_verification.dart';
import 'package:medicon/ui/pages/onboarding/medical_registration.dart';
import 'package:medicon/ui/pages/onboarding/proof_of_medical_qualification.dart';
import 'package:medicon/ui/pages/onboarding/select_country.dart';
import 'package:medicon/ui/pages/onboarding/specialty_certificate.dart';
import 'package:medicon/ui/pages/onboarding/success.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:medicon/ui/utils/router.dart';
import 'package:medicon/utils/router.dart';
import 'package:provider/provider.dart';


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
  

  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<OnboardingServices>(context, listen: false).GetMedicalQualificationIsPending());
    Future.microtask(() => Provider.of<OnboardingServices>(context, listen: false).GetMedicalRegistrationIsPending());
    Future.microtask(() => Provider.of<OnboardingServices>(context, listen: false).GetAdditionalCertificateIsPending());
    Future.microtask(() => Provider.of<OnboardingServices>(context, listen: false).GetCurrentEmploymentIsPending());
    Future.microtask(() => Provider.of<OnboardingServices>(context, listen: false).GetCurrentYearLicenseIsPending());
    Future.microtask(() => Provider.of<OnboardingServices>(context, listen: false).GetIdentityVerificationIsPending());
    Future.microtask(() => Provider.of<OnboardingServices>(context, listen: false).GetAdditionalCertificateIsPending());
    Future.microtask(() => Provider.of<OnboardingServices>(context, listen: false).GetSpecialtyCertificateIsPending());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingServices>(
      builder: (context, onboardingServices, child) {
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
            if(onboardingServices.Index > 0)
              Container(
                height: 20.h,
                margin: EdgeInsets.only(bottom: 10.h),
                child: Row(
                  children: [
                    ListView.builder(
                      itemCount: onboardingServices.notVerifiedProfiles.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedContainer(
                              width: 40.h,
                              height: 6.h,
                              duration: const Duration(seconds: 1),
                              decoration: BoxDecoration(
                                color: index  < onboardingServices.Index ? 
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
                      onboardingServices.Index == 0 ? '':
                      onboardingServices.Index > onboardingServices.notVerifiedProfiles.length ? 
                      '${onboardingServices.notVerifiedProfiles.length}/${onboardingServices.notVerifiedProfiles.length}':
                      '${onboardingServices.Index}/${onboardingServices.notVerifiedProfiles.length}',
                      fontSize: 13.sp,
                      textAlign: TextAlign.start,
                      color: AppColors.black
                    ),
                  ],
                ),
              ),
            SizedBox(height: 20.h),
            ListView.builder(
                  itemCount: onboardingServices.notVerifiedProfiles.length,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  //padding: EdgeInsets.only(top: 10.h, bottom: 100.h),
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        UserDetailCard(
                          title: onboardingServices.notVerifiedProfiles[index].title,
                          iconData: onboardingServices.notVerifiedProfiles[index].iconData,
                          iconColor:onboardingServices.notVerifiedProfiles[index].iconColor,
                          cardColor: AppColors.grey,
                          cardBorderColor: AppColors.textBlack,
                          onTap: () async {
                            for(var i = 0; i < onboardingServices.notVerifiedProfiles.length; i++){
                              onboardingServices.notVerifiedProfiles[i].isActive = false;
                            }
                            onboardingServices.notVerifiedProfiles[index].isActive = true;
                            onboardingServices.uploadingOnboardingFiles(context, index);
                          },
                          isActive: onboardingServices.notVerifiedProfiles[index].isActive,
                          isPendingVerification: onboardingServices.notVerifiedProfiles[index].isPendingVerification,
                        ),
                        SizedBox(height: 20.h),
                      ],
                    );
                  },
            ),
            SizedBox(height: 20.h),
            buttonWithBorder(
                'Submit for verification',
                buttonColor: AppColors.darkGreen,
                fontSize: 15.sp,
                height: 56.h,
                textColor: AppColors.white,
                fontWeight: FontWeight.w300,
                busy: onboardingServices.isLoading,
                onTap: ()async  {
                  if(onboardingServices.medicalQualificationFiles.length > 0){
                    await onboardingServices.StoreProofOfMedicalQualification(
                      context: context, medicalQualificationFiles: onboardingServices.medicalQualificationFiles
                    );
                  }

                  if(onboardingServices.medicalRegistrationFiles.length > 0){
                    await onboardingServices.StoreMedicalRegistration(
                      context: context, medicalRegistrationFiles: onboardingServices.medicalRegistrationFiles
                    );
                  }

                  if(onboardingServices.currentYearLicenseFiles.length > 0){
                    await onboardingServices.StoreCurrentYearLicenseFile(
                      context: context, currentYearLicenseFiles: onboardingServices.currentYearLicenseFiles
                    );
                  }

                  if(onboardingServices.additionalCertificateFiles.length > 0){
                    await onboardingServices.StoreAdditionalCertificate(
                      context: context, additionalCertificateFiles: onboardingServices.additionalCertificateFiles
                    );
                  }

                  if(onboardingServices.identityVerificationFiles.length > 0){
                    await onboardingServices.StoreIdentityVerificationFile(
                      context: context, identityVerificationFiles: onboardingServices.identityVerificationFiles
                    );
                  }

                  if(onboardingServices.currentEmploymentFiles.length > 0){
                    await onboardingServices.StoreCurrentEmploymentFile(
                      context: context, currentEmploymentFiles: onboardingServices.currentEmploymentFiles
                    );
                  }

                  if(onboardingServices.specialtyCertificateFiles.length > 0){
                    await onboardingServices.StoreSpecialtyCertificateFile(
                      context: context, specialtyCertificateFiles: onboardingServices.specialtyCertificateFiles
                    );
                  }
                  Map<String, dynamic> user = Map<String, dynamic> ();
                  user["country"] = widget.country;
                  user["specialization"] = widget.userType;
                  String errorMessage = await onboardingServices.UpdateUser(context: context, user: user);
                  print("errorMessage: $errorMessage");
                  nextPage(context, page: const SuccessScreen());
                },
            ),
            SizedBox(height: 20.h),
            buttonWithBorder(
              'Save for later',
              buttonColor: AppColors.white,
              borderColor: AppColors.darkGreen,
              fontSize: 15.sp,
              height: 56.h,
              //busy: authProvider.isLoading,
              textColor: AppColors.darkGreen,
              fontWeight: FontWeight.w300,
              onTap: () {
                
              },
            ),
          ],
        ),
      );
    });
  }
}