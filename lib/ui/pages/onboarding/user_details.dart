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
  int _index = -1;
  //List<NotVerifiedProfile> pendingVerificationProfiles = [];
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
    NotVerifiedProfile(
      title: 'Specialty Registration',
      iconColor: Colors.greenAccent,
      iconData: Icons.badge_outlined,
      isActive: false,
      isPendingVerification: false
    ),
  ];
  List<MedicalQualificationFile> medicalQualificationFiles = [];
  String yearOfMedicalQualification = "";
  String dateStarted = "";
  String specialty = "";
  List<MedicalRegistrationFile> medicalRegistrationFiles = [];
  List<CurrentYearLicenseFile> currentYearLicenseFiles = [];
  List<AdditionalCertificateFile> additionalCertificateFiles = [];
  List<CurrentEmploymentFile> currentEmploymentFiles = [];
  List<IdentityVerificationFile> identityVerificationFiles = [];//
  List<SpecialtyCertificateFile> specialtyCertificateFiles = [];

  void set_index(){
    _index = 0;
    if(medicalQualificationFiles.length > 0){//
      _index = _index + 1;
    }
    if(medicalRegistrationFiles.length > 0){//
      _index = _index + 1;
    }
    if(additionalCertificateFiles.length > 0){//
      _index = _index + 1;
    }
    if(currentEmploymentFiles.length > 0){//
      _index = _index + 1;
    }
    if(identityVerificationFiles.length > 0){
      _index = _index + 1;
    }
    if(specialtyCertificateFiles.length > 0){//
      _index = _index + 1;
    }
    if(currentYearLicenseFiles.length > 0){//
      _index = _index + 1;
    }

    setState(() {});
  }

  void setMedicalQualificationFiles(FilePayload? filePayload, int index){
    if (filePayload != null) {
      yearOfMedicalQualification = filePayload.others as String;
      medicalQualificationFiles = filePayload.filePayloads.map((FilePayloadBackend e) {
        MedicalQualificationFile medicalQualificationFile = 
        MedicalQualificationFile(e.url, e.fileName, e.originalFileName,
        yearOfMedicalQualification, "xyz", true);
        return medicalQualificationFile;
      }).toList();
      
      if(medicalQualificationFiles.length > 0){
        set_index();
        notVerifiedProfiles[index].isPendingVerification = true;
      }
     
      if(filePayload.errorMessage != "No Error"){
        errorSnackBar(context, 
        filePayload.errorMessage!, 
        duration: 10);
      }
      /* else{
        successSnackBar(context, "Files stored successfully");
      } */
    }

    setState(() {});
  }

  void setMedicalRegistrationFiles(FilePayload? filePayload, int index){
    if (filePayload != null) {
      medicalRegistrationFiles = filePayload.filePayloads.map((FilePayloadBackend e) {
        MedicalRegistrationFile medicalRegistrationFile = 
        MedicalRegistrationFile(e.url, e.fileName, e.originalFileName,
        "xyz", true);
        return medicalRegistrationFile;
      }).toList();
      
      if(medicalRegistrationFiles.length > 0){
        set_index();
        notVerifiedProfiles[index].isPendingVerification = true;
      }
      if(filePayload.errorMessage != "No Error"){
        errorSnackBar(context, 
        filePayload.errorMessage!, 
        duration: 10);
      }
    
    }

    setState(() {});
  }
  
  void setCurrentYearOfLicenseFiles(FilePayload? filePayload, int index){
    if (filePayload != null) {
      currentYearLicenseFiles = filePayload.filePayloads.map((FilePayloadBackend e) {
        CurrentYearLicenseFile currentYearLicenseFile = 
        CurrentYearLicenseFile(e.url, e.fileName, e.originalFileName,
        "xyz", true);
        return currentYearLicenseFile;
      }).toList();
      
      if(currentYearLicenseFiles.length > 0){
        set_index();
        notVerifiedProfiles[index].isPendingVerification = true;
      }
      if(filePayload.errorMessage != "No Error"){
        errorSnackBar(context, 
        filePayload.errorMessage!, 
        duration: 10);
      }
    
    }

    setState(() {});
  }

  void setAdditionalCertificateFiles(FilePayload? filePayload, int index){
    if (filePayload != null) {
      additionalCertificateFiles = filePayload.filePayloads.map((FilePayloadBackend e) {
        AdditionalCertificateFile additionalCertificateFile = 
        AdditionalCertificateFile(e.url, e.fileName, e.originalFileName,
        "xyz", true);
        return additionalCertificateFile;
      }).toList();
      
      if(additionalCertificateFiles.length > 0){
        set_index();
        notVerifiedProfiles[index].isPendingVerification = true;
      }
      if(filePayload.errorMessage != "No Error"){
        errorSnackBar(context, 
        filePayload.errorMessage!, 
        duration: 10);
      }
    
    }

    setState(() {});
  }
  
  void setCurrentEmploymentFiles(FilePayload? filePayload, int index){
    if (filePayload != null) {
      dateStarted = filePayload.others as String;
      currentEmploymentFiles = filePayload.filePayloads.map((FilePayloadBackend e) {
        CurrentEmploymentFile currentEmploymentFile = 
        CurrentEmploymentFile(e.url, e.fileName, e.originalFileName,
        "xyz", dateStarted, true);
        return currentEmploymentFile;
      }).toList();
      
      if(currentEmploymentFiles.length > 0){
        set_index();
        notVerifiedProfiles[index].isPendingVerification = true;
      }
      if(filePayload.errorMessage != "No Error"){
        errorSnackBar(context, 
        filePayload.errorMessage!, 
        duration: 10);
      }
    
    }

    setState(() {});
  }

  void setIdentityVerificationFiles(FilePayload? filePayload, int index){
    if (filePayload != null) {
      identityVerificationFiles = filePayload.filePayloads.map((FilePayloadBackend e) {
        IdentityVerificationFile identityVerificationFile = 
        IdentityVerificationFile(e.url, e.fileName, e.originalFileName,
        "xyz", true);
        return identityVerificationFile;
      }).toList();
      
      if(identityVerificationFiles.length > 0){
        set_index();
        notVerifiedProfiles[index].isPendingVerification = true;
      }
      if(filePayload.errorMessage != "No Error"){
        errorSnackBar(context, 
        filePayload.errorMessage!, 
        duration: 10);
      }
    
    }

    setState(() {});
  }

  void setSpecialtyCertificateFiles(FilePayload? filePayload, int index){
    if (filePayload != null) {
      specialty = filePayload.others as String;
      specialtyCertificateFiles = filePayload.filePayloads.map((FilePayloadBackend e) {
        SpecialtyCertificateFile specialtyCertificateFile = 
        SpecialtyCertificateFile(e.url, e.fileName, e.originalFileName,
        "xyz", true, specialty);
        return specialtyCertificateFile;
      }).toList();
      
      if(specialtyCertificateFiles.length > 0){
        set_index();
        notVerifiedProfiles[index].isPendingVerification = true;
      }
      if(filePayload.errorMessage != "No Error"){
        errorSnackBar(context, 
        filePayload.errorMessage!, 
        duration: 10);
      }
    
    }

    setState(() {});
  }

  void uploadingOnboardingFiles (int index) async {
    switch(notVerifiedProfiles[index].title){
      case 'Proof of medical qualification':
        FilePayload? filePayload = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProofOfMedicalQualificationScreen(
            notVerifiedProfiles[index].title
            ),
          ),
        );
        setMedicalQualificationFiles(filePayload, index);
      case 'Full Medical Registration':
        FilePayload? filePayload = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MedicalRegistrationScreen(
            notVerifiedProfiles[index].title
            ),
          ),
        );
        setMedicalRegistrationFiles(filePayload, index);
      case 'Current Year License':
        FilePayload? filePayload = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CurrentYearLicenseScreen(
            notVerifiedProfiles[index].title
            ),
          ),
        );
        setCurrentYearOfLicenseFiles(filePayload, index);
      case 'Additional Certificates':
        FilePayload? filePayload = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AdditionalCertificateScreen(
            notVerifiedProfiles[index].title
            ),
          ),
        );
        setAdditionalCertificateFiles(filePayload, index);
      case 'Identity Verification':
        FilePayload? filePayload = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IdentityVerificationScreen(
            notVerifiedProfiles[index].title
            ),
          ),
        );
        setIdentityVerificationFiles(filePayload, index);
      case 'Current Employment':
        FilePayload? filePayload = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CurrentEmploymentScreen(
            notVerifiedProfiles[index].title
            ),
          ),
        );
        setCurrentEmploymentFiles(filePayload, index);
      case 'Specialty Registration':
        FilePayload? filePayload = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SpecialtyCertificateScreen(
            notVerifiedProfiles[index].title
            ),
          ),
        );
        setSpecialtyCertificateFiles(filePayload, index);
        
    }
  }

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
          if(_index > 0)
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
                            width: 40.h,
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
                    _index == 0 ? '':
                    _index > notVerifiedProfiles.length ? 
                    '${notVerifiedProfiles.length}/${notVerifiedProfiles.length}':
                    '${_index}/${notVerifiedProfiles.length}',
                    fontSize: 13.sp,
                    textAlign: TextAlign.start,
                    color: AppColors.black
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
                          for(var i = 0; i < notVerifiedProfiles.length; i++){
                            notVerifiedProfiles[i].isActive = false;
                          }
                          notVerifiedProfiles[index].isActive = true;
                          uploadingOnboardingFiles(index);
                        },
                        isActive: notVerifiedProfiles[index].isActive,
                        isPendingVerification: notVerifiedProfiles[index].isPendingVerification,
                      ),
                      SizedBox(height: 20.h),
                    ],
                  );
                },
          ),
           SizedBox(height: 20.h),
          Consumer<OnboardingServices>(builder: (ctx, fileStorageProvider, child) {
            return buttonWithBorder(
              'Submit for verification',
              buttonColor: AppColors.darkGreen,
              fontSize: 15.sp,
              height: 56.h,
              textColor: AppColors.white,
              fontWeight: FontWeight.w300,
              busy: fileStorageProvider.isLoading,
              onTap: ()async  {
                if(medicalQualificationFiles.length > 0){
                  await fileStorageProvider.StoreProofOfMedicalQualification(
                    context: context, medicalQualificationFiles: medicalQualificationFiles
                  );
                }

                if(medicalRegistrationFiles.length > 0){
                  await fileStorageProvider.StoreMedicalRegistration(
                    context: context, medicalRegistrationFiles: medicalRegistrationFiles
                  );
                }

                if(currentYearLicenseFiles.length > 0){
                  await fileStorageProvider.StoreCurrentYearLicenseFile(
                    context: context, currentYearLicenseFiles: currentYearLicenseFiles
                  );
                }

                if(additionalCertificateFiles.length > 0){
                  await fileStorageProvider.StoreAdditionalCertificate(
                    context: context, additionalCertificateFiles: additionalCertificateFiles
                  );
                }

                if(identityVerificationFiles.length > 0){
                  await fileStorageProvider.StoreIdentityVerificationFile(
                    context: context, identityVerificationFiles: identityVerificationFiles
                  );
                }

                if(currentEmploymentFiles.length > 0){
                  await fileStorageProvider.StoreCurrentEmploymentFile(
                    context: context, currentEmploymentFiles: currentEmploymentFiles
                  );
                }

                if(specialtyCertificateFiles.length > 0){
                  await fileStorageProvider.StoreSpecialtyCertificateFile(
                    context: context, specialtyCertificateFiles: specialtyCertificateFiles
                  );
                }
                Map<String, dynamic> user = Map<String, dynamic> ();
                user["country"] = widget.country;
                user["specialization"] = widget.userType;
                String errorMessage = await fileStorageProvider.UpdateUser(context: context, user: user);
                print("errorMessage: $errorMessage");
                nextPage(context, page: const SuccessScreen());
              },
            );
          }),
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