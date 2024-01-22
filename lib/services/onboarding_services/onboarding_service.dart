import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medicon/models/additional_certificate_file.dart';
import 'package:medicon/models/current_employment_file.dart';
import 'package:medicon/models/current_year_license_file.dart';
import 'package:medicon/models/identity_verification_file.dart';
import 'package:medicon/models/medical_qualification_file.dart';
import 'package:medicon/models/medical_registration_file.dart';
import 'package:medicon/models/specialty.dart';
import 'package:medicon/models/specialty_certificate_file.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingServices with ChangeNotifier {
  bool isLoading = false;
  String status = "";
  String message = "";
  String baseUrl = "http://localhost:8000";
  String userSpecialization = "";
  String userCountry = "";
  bool isGeneralPractitioner = false;
  bool isSpecialist = false;
  String userType = "Is Empty";
  //String baseUrl = "https://medicon-backend.vercel.app";

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
      notifyListeners();

    } else {
      isLoading = false;
      notifyListeners();
      erroMessage = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
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
      //userSpecialization = dataRes["specialization"];
      notifyListeners();

    } else {
      isLoading = false;
      notifyListeners();
      erroMessage = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
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
      //userSpecialization = dataRes["specialization"];
      notifyListeners();

    } else {
      isLoading = false;
      notifyListeners();
      erroMessage = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
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
      //userSpecialization = dataRes["specialization"];
      notifyListeners();

    } else {
      isLoading = false;
      notifyListeners();
      erroMessage = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
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
      //userSpecialization = dataRes["specialization"];
      notifyListeners();

    } else {
      isLoading = false;
      notifyListeners();
      erroMessage = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
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
      //userSpecialization = dataRes["specialization"];
      notifyListeners();

    } else {
      isLoading = false;
      notifyListeners();
      erroMessage = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
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
    
    print("GetCurrentEmploymentIsPending: ${dataRes}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      isLoading = false;
      //userSpecialization = dataRes["specialization"];
      notifyListeners();

    } else {
      isLoading = false;
      notifyListeners();
      erroMessage = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
    }

    return erroMessage;
  }
}