import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medicon/models/additional_certificate_file.dart';
import 'package:medicon/models/current_employment_file.dart';
import 'package:medicon/models/current_year_license_file.dart';
import 'package:medicon/models/external_file.dart';
import 'package:medicon/models/file_payload_backend.dart';
import 'package:medicon/models/identity_verification_file.dart';
import 'package:medicon/models/medical_qualification_file.dart';
import 'package:medicon/models/medical_registration_file.dart';
import 'package:medicon/models/not_verified_profile.dart';
import 'package:medicon/models/specialty.dart';
import 'package:medicon/models/specialty_certificate_file.dart';
import 'package:medicon/ui/components/snackbar.dart';
import 'package:medicon/ui/pages/onboarding/additional_certificate.dart';
import 'package:medicon/ui/pages/onboarding/current_employment.dart';
import 'package:medicon/ui/pages/onboarding/current_year_license.dart';
import 'package:medicon/ui/pages/onboarding/identity_verification.dart';
import 'package:medicon/ui/pages/onboarding/medical_registration.dart';
import 'package:medicon/ui/pages/onboarding/proof_of_medical_qualification.dart';
import 'package:medicon/ui/pages/onboarding/specialty_certificate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingServices with ChangeNotifier {
  bool isLoading = false;
  String status = "";
  String message = "";
  //String baseUrl = "http://localhost:8000";
  String baseUrl = "https://medicon-backend.vercel.app";
  String userSpecialization = "";
  String userCountry = "";
  bool isGeneralPractitioner = false;
  bool isSpecialist = false;
  String userType = "Is Empty";
  int Index = -1;
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

  Future StoreProofOfMedicalQualification(
    {
    BuildContext? context,
    List<MedicalQualificationFile>? medicalQualificationFiles,
  }) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
     String? tokens = sf.getString("token");
    String url = "$baseUrl/medicalQualification/create";

    List<MedicalQualificationFile> _medicalQualificationFiles = medicalQualificationFiles!;
    //bool checkError = false;
    String errorMessage = "Failed to upload file(s):\n";
    
    

    isLoading = true;
    notifyListeners();
    //Map<String, dynamic> _body = filePayload.toJson(yearOfMedicalQualification!);
    //print("filePayloads: ${filePayload.toJson2(yearOfMedicalQualification!)}");
   for(int i = 0; i < _medicalQualificationFiles.length; i++){
    String json = jsonEncode(_medicalQualificationFiles[i]);
    print("json: $json");
    var response = await http.post(
      Uri.parse(url),
      body:  json,
      headers: {
        //'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
    );
    print(response.body);
    print("=================================================");
    //var dataRes = jsonDecode(response.body);
    final _medicalQualificationFileMap = jsonDecode(response.body) as Map<String, dynamic>;
    print("_medicalQualificationFileMap: ${_medicalQualificationFileMap}");
    final _medicalQualificationFile = MedicalQualificationFile.fromJson(_medicalQualificationFileMap);
    print("_medicalQualificationFile: ${_medicalQualificationFile}");
    
      if(response.statusCode != 200 && response.statusCode != 201){
         print("$i: ERROR SEEN");
        errorMessage = errorMessage + '${_medicalQualificationFileMap["message"]}' + '\n';
        //checkError = true;
        
      }
   }

   isLoading = false;
    notifyListeners();
  }

  Future StoreMedicalRegistration(
    {
    BuildContext? context,
    List<MedicalRegistrationFile>? medicalRegistrationFiles,
  }) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
     String? tokens = sf.getString("token");
    String url = "$baseUrl/medicalRegistration/create";

    List<MedicalRegistrationFile> _medicalRegistrationFiles = medicalRegistrationFiles!;
    //bool checkError = false;
    String errorMessage = "Failed to upload file(s):\n";
    
    

    isLoading = true;
    notifyListeners();
   for(int i = 0; i < _medicalRegistrationFiles.length; i++){
    String json = jsonEncode(_medicalRegistrationFiles[i]);
    var response = await http.post(
      Uri.parse(url),
      body:  json,
      headers: {
        //'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
    );
    print("=================================================");
    final _medicalRegistrationFileMap = jsonDecode(response.body) as Map<String, dynamic>;
    final _medicalRegistrationFile = MedicalRegistrationFile.fromJson(_medicalRegistrationFileMap);
    print("_medicalRegistrationFile: ${_medicalRegistrationFile}");
      if(response.statusCode != 200 && response.statusCode != 201){
        errorMessage = errorMessage + '${_medicalRegistrationFileMap["message"]}' + '\n';
        //checkError = true;
        
      }
   }

   isLoading = false;
    notifyListeners();
  }

  Future StoreAdditionalCertificate(
    {
    BuildContext? context,
    List<AdditionalCertificateFile>? additionalCertificateFiles,
  }) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
     String? tokens = sf.getString("token");
    String url = "$baseUrl/additionalCertificate/create";

    List<AdditionalCertificateFile> _additionalCertificateFiles = additionalCertificateFiles!;
    //bool checkError = false;
    String errorMessage = "Failed to upload file(s):\n";
    
    

    isLoading = true;
    notifyListeners();
   for(int i = 0; i < _additionalCertificateFiles.length; i++){
    String json = jsonEncode(_additionalCertificateFiles[i]);
    var response = await http.post(
      Uri.parse(url),
      body:  json,
      headers: {
        //'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
    );
    print("=================================================");
    final _additionalCertificateFileMap = jsonDecode(response.body) as Map<String, dynamic>;
    final _additionalCertificateFile = AdditionalCertificateFile.fromJson(_additionalCertificateFileMap);
    print("_additionalCertificateFile: ${_additionalCertificateFile}");
      if(response.statusCode != 200 && response.statusCode != 201){
        errorMessage = errorMessage + '${_additionalCertificateFileMap["message"]}' + '\n';
        //checkError = true;
        
      }
   }

   isLoading = false;
    notifyListeners();
  }

  Future StoreCurrentEmploymentFile(
    {
    BuildContext? context,
    List<CurrentEmploymentFile>? currentEmploymentFiles,
  }) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
     String? tokens = sf.getString("token");
    String url = "$baseUrl/currentEmployment/create";

    List<CurrentEmploymentFile> _currentEmploymentFiles = currentEmploymentFiles!;
    //bool checkError = false;
    String errorMessage = "Failed to upload file(s):\n";
    
    

    isLoading = true;
    notifyListeners();
   for(int i = 0; i < _currentEmploymentFiles.length; i++){
    String json = jsonEncode(_currentEmploymentFiles[i]);
    var response = await http.post(
      Uri.parse(url),
      body:  json,
      headers: {
        //'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
    );
    print("=================================================");
    final _currentEmploymentFileMap = jsonDecode(response.body) as Map<String, dynamic>;
    final _currentEmploymentFile = CurrentEmploymentFile.fromJson(_currentEmploymentFileMap);
    print("_currentEmploymentFile: ${_currentEmploymentFile}");
      if(response.statusCode != 200 && response.statusCode != 201){
        errorMessage = errorMessage + '${_currentEmploymentFileMap["message"]}' + '\n';
        //checkError = true;
        
      }
   }

   isLoading = false;
    notifyListeners();
  }

  Future StoreCurrentYearLicenseFile(
    {
    BuildContext? context,
    List<CurrentYearLicenseFile>? currentYearLicenseFiles,
  }) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
     String? tokens = sf.getString("token");
    String url = "$baseUrl/currentYearLicense/create";

    List<CurrentYearLicenseFile> _currentYearLicenseFiles = currentYearLicenseFiles!;
    //bool checkError = false;
    String errorMessage = "Failed to upload file(s):\n";
    
    

    isLoading = true;
    notifyListeners();
   for(int i = 0; i < _currentYearLicenseFiles.length; i++){
    String json = jsonEncode(_currentYearLicenseFiles[i]);
    var response = await http.post(
      Uri.parse(url),
      body:  json,
      headers: {
        //'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
    );
    print("=================================================");
    final _currentYearLicenseFileMap = jsonDecode(response.body) as Map<String, dynamic>;
    final _currentYearLicenseFile = CurrentYearLicenseFile.fromJson(_currentYearLicenseFileMap);
    print("_currentYearLicenseFile: ${_currentYearLicenseFile}");
      if(response.statusCode != 200 && response.statusCode != 201){
        errorMessage = errorMessage + '${_currentYearLicenseFileMap["message"]}' + '\n';
        //checkError = true;
        
      }
   }

   isLoading = false;
    notifyListeners();
  }

  Future StoreIdentityVerificationFile(
    {
    BuildContext? context,
    List<IdentityVerificationFile>? identityVerificationFiles,
  }) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
     String? tokens = sf.getString("token");
    String url = "$baseUrl/identityVerification/create";

    List<IdentityVerificationFile> _identityVerificationFiles = identityVerificationFiles!;
    //bool checkError = false;
    String errorMessage = "Failed to upload file(s):\n";
    
    

    isLoading = true;
    notifyListeners();
   for(int i = 0; i < _identityVerificationFiles.length; i++){
    String json = jsonEncode(_identityVerificationFiles[i]);
    var response = await http.post(
      Uri.parse(url),
      body:  json,
      headers: {
        //'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
    );
    print("=================================================");
    final _identityVerificationFileMap = jsonDecode(response.body) as Map<String, dynamic>;
    final _identityVerificationFile = IdentityVerificationFile.fromJson(_identityVerificationFileMap);
    print("_identityVerificationFile: ${_identityVerificationFile}");
      if(response.statusCode != 200 && response.statusCode != 201){
        errorMessage = errorMessage + '${_identityVerificationFileMap["message"]}' + '\n';
        //checkError = true;
        
      }
   }

   isLoading = false;
    notifyListeners();
  }

  Future StoreSpecialty(
    {
    BuildContext? context,
    List<Specialty>? specialties,
  }) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
     String? tokens = sf.getString("token");
    String url = "$baseUrl/specialty/create";

    List<Specialty> _specialties = specialties!;
    //bool checkError = false;
    String errorMessage = "Failed to upload file(s):\n";
    
    

    isLoading = true;
    notifyListeners();
   for(int i = 0; i < _specialties.length; i++){
    String json = jsonEncode(_specialties[i]);
    var response = await http.post(
      Uri.parse(url),
      body:  json,
      headers: {
        //'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
    );
    print("=================================================");
    final _specialtyMap = jsonDecode(response.body) as Map<String, dynamic>;
    final _specialty = Specialty.fromJson(_specialtyMap);
    print("_specialty: ${_specialty}");
      if(response.statusCode != 200 && response.statusCode != 201){
        errorMessage = errorMessage + '${_specialtyMap["message"]}' + '\n';
        //checkError = true;
        
      }
   }

   isLoading = false;
    notifyListeners();
  }

  Future StoreSpecialtyCertificateFile(
    {
    BuildContext? context,
    List<SpecialtyCertificateFile>? specialtyCertificateFiles,
  }) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    String? tokens = sf.getString("token");
    String url = "$baseUrl/specialtyCertificate/create";

    List<SpecialtyCertificateFile> _specialtyCertificateFiles = specialtyCertificateFiles!;
    //bool checkError = false;
    String errorMessage = "Failed to upload file(s):\n";
    
    

    isLoading = true;
    notifyListeners();
   for(int i = 0; i < _specialtyCertificateFiles.length; i++){
    String json = jsonEncode(_specialtyCertificateFiles[i]);
    var response = await http.post(
      Uri.parse(url),
      body:  json,
      headers: {
        //'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
    );
    print("=================================================");
    final _specialtyCertificateFileMap = jsonDecode(response.body) as Map<String, dynamic>;
    final _specialtyCertificateFile = SpecialtyCertificateFile.fromJson(_specialtyCertificateFileMap);
    print("_specialtyCertificateFiles: ${_specialtyCertificateFile}");
      if(response.statusCode != 200 && response.statusCode != 201){
        errorMessage = errorMessage + '${_specialtyCertificateFileMap["message"]}' + '\n';
        //checkError = true;
        
      }
   }

   isLoading = false;
    notifyListeners();
  }

  Future<String> UpdateUser({
    BuildContext? context,
    Map<String, dynamic>? user,
  }) async {
   
   SharedPreferences sf = await SharedPreferences.getInstance();
    String? tokens = sf.getString("token");
    String url = "$baseUrl/user/update";
    isLoading = true;
    notifyListeners();
    String erroMessage = "No Error";
    
    var response = await http.post(
      Uri.parse(url),
      body: user,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens',
      },
    );
    isLoading = false;
    notifyListeners();
    print("Status Code ${response.statusCode}");
    var dataRes = jsonDecode(response.body);
    
    print(dataRes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      isLoading = false;
      notifyListeners();

    } else {
      isLoading = false;
      notifyListeners();
      erroMessage = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
    }

    return erroMessage;
  }

  Future<String> GetUserCountry({
    BuildContext? context,
    Map<String, dynamic>? user,
  }) async {
   
   SharedPreferences sf = await SharedPreferences.getInstance();
    String? tokens = sf.getString("token");
    String url = "$baseUrl/user/getCurrentUser";
    isLoading = true;
    notifyListeners();
    String erroMessage = "No Error";
    
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens',
      },
    );
    isLoading = false;
    notifyListeners();
    print("Status Code ${response.statusCode}");
    var dataRes = jsonDecode(response.body);
    
    print(dataRes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      isLoading = false;
      userCountry = dataRes["country"];
      notifyListeners();

    } else {
      isLoading = false;
      notifyListeners();
      erroMessage = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
    }

    return erroMessage;
  }

  void setUserCountry(String selectedCountry){
    userCountry = selectedCountry;
    notifyListeners();
  }

  Future<String> GetUserSpecialization({
    BuildContext? context,
    Map<String, dynamic>? user,
  }) async {
   
   SharedPreferences sf = await SharedPreferences.getInstance();
    String? tokens = sf.getString("token");
    String url = "$baseUrl/user/getCurrentUser";
    isLoading = true;
    notifyListeners();
    String erroMessage = "No Error";
    
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens',
      },
    );
    isLoading = false;
    notifyListeners();
    print("Status Code ${response.statusCode}");
    var dataRes = jsonDecode(response.body);
    
    print(dataRes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      isLoading = false;
      userSpecialization = dataRes["specialization"];
      updateUserType(dataRes["specialization"]);
      notifyListeners();

    } else {
      isLoading = false;
      notifyListeners();
      erroMessage = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
    }

    return erroMessage;
  }

  void updateUserType(String _userType){
    switch(_userType){
      case "General Practitioner":
      isGeneralPractitioner = true;
      isSpecialist = false;
      userType = _userType;

      case "Specialist":
      isGeneralPractitioner = false;
      isSpecialist = true;
      userType = _userType;
    }

    notifyListeners();
  }

  Future<String> GetMedicalQualificationIsPending({
    BuildContext? context,
    Map<String, dynamic>? user,
  }) async {
   
   SharedPreferences sf = await SharedPreferences.getInstance();
    String? tokens = sf.getString("token");
    String url = "$baseUrl/medicalQualification/getIsPending";
    isLoading = true;
    notifyListeners();
    String erroMessage = "No Error";
    
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens',
      },
    );
    isLoading = false;
    notifyListeners();
    print("Status Code ${response.statusCode}");
    var dataRes = jsonDecode(response.body);
    
    print("GetMedicalQualificationIsPending: ${dataRes}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      isLoading = false;
      //userSpecialization = dataRes["specialization"];
      notVerifiedProfiles[0].isPendingVerification = dataRes;
      notifyListeners();

    } else {
      isLoading = false;
      erroMessage = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
      notifyListeners();
    }

    return erroMessage;
  }

  Future<String> GetMedicalRegistrationIsPending({
    BuildContext? context,
    Map<String, dynamic>? user,
  }) async {
   
   SharedPreferences sf = await SharedPreferences.getInstance();
    String? tokens = sf.getString("token");
    String url = "$baseUrl/medicalRegistration/getIsPending";
    isLoading = true;
    notifyListeners();
    String erroMessage = "No Error";
    
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens',
      },
    );
    isLoading = false;
    notifyListeners();
    print("Status Code ${response.statusCode}");
    var dataRes = jsonDecode(response.body);
    
    print("GetMedicalRegistrationIsPending: ${dataRes}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      isLoading = false;
      notVerifiedProfiles[1].isPendingVerification = dataRes;
      notifyListeners();

    } else {
      isLoading = false;
      erroMessage = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
      notifyListeners();
    }

    return erroMessage;
  }

  Future<String> GetSpecialtyCertificateIsPending({
    BuildContext? context,
    Map<String, dynamic>? user,
  }) async {
   
   SharedPreferences sf = await SharedPreferences.getInstance();
    String? tokens = sf.getString("token");
    String url = "$baseUrl/specialtyCertificate/getIsPending";
    isLoading = true;
    notifyListeners();
    String erroMessage = "No Error";
    
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens',
      },
    );
    isLoading = false;
    notifyListeners();
    print("Status Code ${response.statusCode}");
    var dataRes = jsonDecode(response.body);
    
    print("GetSpecialtyCertificateIsPending: ${dataRes}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      isLoading = false;
      notVerifiedProfiles[6].isPendingVerification = dataRes;
      notifyListeners();

    } else {
      isLoading = false;
      erroMessage = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
      notifyListeners();
    }

    return erroMessage;
  }

  Future<String> GetIdentityVerificationIsPending({
    BuildContext? context,
    Map<String, dynamic>? user,
  }) async {
   
   SharedPreferences sf = await SharedPreferences.getInstance();
    String? tokens = sf.getString("token");
    String url = "$baseUrl/identityVerification/getIsPending";
    isLoading = true;
    notifyListeners();
    String erroMessage = "No Error";
    
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens',
      },
    );
    isLoading = false;
    notifyListeners();
    print("Status Code ${response.statusCode}");
    var dataRes = jsonDecode(response.body);
    
    print("GetIdentityVerificationIsPending: ${dataRes}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      isLoading = false;
      notVerifiedProfiles[4].isPendingVerification = dataRes;
      notifyListeners();

    } else {
      isLoading = false;
      erroMessage = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
      notifyListeners();
    }

    return erroMessage;
  }

  Future<String> GetCurrentYearLicenseIsPending({
    BuildContext? context,
    Map<String, dynamic>? user,
  }) async {
   
   SharedPreferences sf = await SharedPreferences.getInstance();
    String? tokens = sf.getString("token");
    String url = "$baseUrl/currentYearLicense/getIsPending";
    isLoading = true;
    notifyListeners();
    String erroMessage = "No Error";
    
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens',
      },
    );
    isLoading = false;
    notifyListeners();
    print("Status Code ${response.statusCode}");
    var dataRes = jsonDecode(response.body);
    
    print("GetCurrentYearLicenseIsPending: ${dataRes}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      isLoading = false;
      notVerifiedProfiles[2].isPendingVerification = dataRes;
      notifyListeners();

    } else {
      isLoading = false;
      erroMessage = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
      notifyListeners();
    }

    return erroMessage;
  }

  Future<String> GetCurrentEmploymentIsPending({
    BuildContext? context,
    Map<String, dynamic>? user,
  }) async {
   
   SharedPreferences sf = await SharedPreferences.getInstance();
    String? tokens = sf.getString("token");
    String url = "$baseUrl/currentEmployment/getIsPending";
    isLoading = true;
    notifyListeners();
    String erroMessage = "No Error";
    
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens',
      },
    );
    isLoading = false;
    notifyListeners();
    print("Status Code ${response.statusCode}");
    var dataRes = jsonDecode(response.body);
    
    print("GetCurrentEmploymentIsPending: ${dataRes}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      isLoading = false;
      notVerifiedProfiles[5].isPendingVerification = dataRes;
      notifyListeners();

    } else {
      isLoading = false;
      erroMessage = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
      notifyListeners();
    }

    return erroMessage;
  }

  Future<String> GetAdditionalCertificateIsPending({
    BuildContext? context,
    Map<String, dynamic>? user,
  }) async {
   
   SharedPreferences sf = await SharedPreferences.getInstance();
    String? tokens = sf.getString("token");
    String url = "$baseUrl/additionalCertificate/getIsPending";
    isLoading = true;
    notifyListeners();
    String erroMessage = "No Error";
    
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens',
      },
    );
    isLoading = false;
    notifyListeners();
    print("Status Code ${response.statusCode}");
    var dataRes = jsonDecode(response.body);
    
    print("GetAdditionalCertificateIsPending: ${dataRes}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      isLoading = false;
      notVerifiedProfiles[3].isPendingVerification = dataRes;
      notifyListeners();

    } else {
      isLoading = false;
      erroMessage = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
      notifyListeners();
    }

    return erroMessage;
  }

  void set_index(){
    Index = 0;
    if(medicalQualificationFiles.length > 0){//
      Index = Index + 1;
    }
    if(medicalRegistrationFiles.length > 0){//
      Index = Index + 1;
    }
    if(additionalCertificateFiles.length > 0){//
      Index = Index + 1;
    }
    if(currentEmploymentFiles.length > 0){//
      Index = Index + 1;
    }
    if(identityVerificationFiles.length > 0){
      Index = Index + 1;
    }
    if(specialtyCertificateFiles.length > 0){//
      Index = Index + 1;
    }
    if(currentYearLicenseFiles.length > 0){//
      Index = Index + 1;
    }

   notifyListeners();
  }

  void setMedicalQualificationFiles(BuildContext context, FilePayload? filePayload, int index){
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

    notifyListeners();
  }

  void setMedicalRegistrationFiles(BuildContext context, FilePayload? filePayload, int index){
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

    notifyListeners();
  }
  
  void setCurrentYearOfLicenseFiles(BuildContext context, FilePayload? filePayload, int index){
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

    notifyListeners();
  }

  void setAdditionalCertificateFiles(BuildContext context, FilePayload? filePayload, int index){
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

    notifyListeners();
  }
  
  void setCurrentEmploymentFiles(BuildContext context, FilePayload? filePayload, int index){
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

    notifyListeners();
  }

  void setIdentityVerificationFiles(BuildContext context, FilePayload? filePayload, int index){
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

    notifyListeners();
  }

  void setSpecialtyCertificateFiles(BuildContext context, FilePayload? filePayload, int index){
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

    notifyListeners();
  }

  void uploadingOnboardingFiles (BuildContext ctx, int index) async {
    switch(notVerifiedProfiles[index].title){
      case 'Proof of medical qualification':
        FilePayload? filePayload = await Navigator.push(
          ctx,
          MaterialPageRoute(
            builder: (context) => ProofOfMedicalQualificationScreen(
            notVerifiedProfiles[index].title
            ),
          ),
        );
        setMedicalQualificationFiles(ctx, filePayload, index);
      case 'Full Medical Registration':
        FilePayload? filePayload = await Navigator.push(
          ctx,
          MaterialPageRoute(
            builder: (context) => MedicalRegistrationScreen(
            notVerifiedProfiles[index].title
            ),
          ),
        );
        setMedicalRegistrationFiles(ctx, filePayload, index);
      case 'Current Year License':
        FilePayload? filePayload = await Navigator.push(
          ctx,
          MaterialPageRoute(
            builder: (context) => CurrentYearLicenseScreen(
            notVerifiedProfiles[index].title
            ),
          ),
        );
        setCurrentYearOfLicenseFiles(ctx, filePayload, index);
      case 'Additional Certificates':
        FilePayload? filePayload = await Navigator.push(
          ctx,
          MaterialPageRoute(
            builder: (context) => AdditionalCertificateScreen(
            notVerifiedProfiles[index].title
            ),
          ),
        );
        setAdditionalCertificateFiles(ctx, filePayload, index);
      case 'Identity Verification':
        FilePayload? filePayload = await Navigator.push(
          ctx,
          MaterialPageRoute(
            builder: (context) => IdentityVerificationScreen(
            notVerifiedProfiles[index].title
            ),
          ),
        );
        setIdentityVerificationFiles(ctx, filePayload, index);
      case 'Current Employment':
        FilePayload? filePayload = await Navigator.push(
          ctx,
          MaterialPageRoute(
            builder: (context) => CurrentEmploymentScreen(
            notVerifiedProfiles[index].title
            ),
          ),
        );
        setCurrentEmploymentFiles(ctx, filePayload, index);
      case 'Specialty Registration':
        FilePayload? filePayload = await Navigator.push(
          ctx,
          MaterialPageRoute(
            builder: (context) => SpecialtyCertificateScreen(
            notVerifiedProfiles[index].title
            ),
          ),
        );
        setSpecialtyCertificateFiles(ctx, filePayload, index);
        
    }
  }
}