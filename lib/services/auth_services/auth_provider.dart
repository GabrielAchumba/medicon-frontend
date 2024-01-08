import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';

/* import 'package:cafia/services/common/shared_preferences_service.dart';
import 'package:cafia/ui/components/snackbar.dart';
import 'package:cafia/ui/pages/auth/login.dart';
import 'package:cafia/ui/pages/auth/signup3_view.dart';
import 'package:cafia/ui/pages/auth/verify_view.dart';
import 'package:cafia/ui/pages/home/dashboard_view.dart';
import 'package:cafia/ui/pages/home/main_layout.dart';
import 'package:cafia/utils/coming_soon.dart';
import 'package:cafia/utils/router.dart'; */
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medicon/services/common/shared_preferences_service.dart';
import 'package:medicon/ui/components/snackbar.dart';
import 'package:medicon/ui/pages/auth/login.dart';
import 'package:medicon/ui/pages/auth/reset_password_screen.dart';
import 'package:medicon/ui/pages/auth/upload_user_photo.dart';
import 'package:medicon/ui/pages/auth/verify_email_view.dart';
import 'package:medicon/ui/pages/auth/verify_forgot_password.dart';
//import 'package:medicon/ui/pages/auth/signup3_view.dart';
import 'package:medicon/ui/pages/auth/verify_view.dart';
//import 'package:medicon/ui/pages/home/main_layout.dart';
import 'package:medicon/utils/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices with ChangeNotifier {
  bool isLoading = false;
  String status = "";
  String message = "";
  String baseUrl = "http://localhost:8000";
  late final Dio _dio;

  AuthServices() : _dio = Dio();
  BuildContext? _context;

  Future sendOTPToEmail({
    BuildContext? context,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? confirmPassword,
    bool isResend = false,
  }) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    String url = "$baseUrl/mail/sendOTPToEmail";

    isLoading = true;
    notifyListeners();
    var response = await http.post(
      Uri.parse(url),
      body: {
        "email": email,
      },
    );
  
    print("=================================================");
    var dataRes = jsonDecode(response.body);
    print(dataRes);
    
    if(dataRes["token"].toString().isNotEmpty){
      print("SUCCESS");
      isLoading = false;
      notifyListeners();
      SharedPreferencesService(sf).setToken(dataRes["token"]);
      if (isResend == true) {
        successSnackBar(context!, dataRes["message"]);
      } else {
        nextPage(context!, page: VerifyEmailView(email!, firstName!,
        lastName!, password!, confirmPassword!));
      }
      successSnackBar(context, dataRes["message"]);
    }else{
      print("ERROR");
      isLoading = false;
      notifyListeners();
      errorSnackBar(context!, dataRes["message"]);
    }
  }

  
  Future UploadFile({
    BuildContext? context,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? confirmPassword,
    List<int>? imageBytes,
    String imageName = "",
  }) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    String url = "$baseUrl/gcp/upload";
    _context = context;

    String extension = imageName.split(".").last;

    print("imageBytes: ${imageBytes}");
    print("imageName: $imageName");
    print("extension: $extension");

    var formData = FormData.fromMap({
      "file": MultipartFile.fromBytes(
        imageBytes!,
        filename: imageName,
        contentType: MediaType("File", extension),
      ),
    });

    isLoading = true;
    notifyListeners();
    var response = await _dio.post(url, data: formData);

    print("test response");
    print(response.data.toString());
    print(response.statusCode);

    String message = response.data["error"];
    if(message == "No Error"){
      String url = response.data["url"];
      String fileName = response.data["fileName"];
      String originalFileName = response.data["originalFileName"];
      await signUp(firstName!,
      lastName!, email!, password!,
      confirmPassword!, url, fileName, originalFileName);
    }else{
      isLoading = false;
      notifyListeners();
      errorSnackBar(context!, response.data["error"]);
    }
  }

  Future UploadFile2({
    BuildContext? context,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? confirmPassword,
    File? image,
  }) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    String url = "$baseUrl/gcp/upload";

    isLoading = true;
    notifyListeners();
    var response = await http.post(
      Uri.parse(url),
      body: {
        "file": image.toString(),
      },
    );
    print(response.body);
    print("=================================================");
    var dataRes = jsonDecode(response.body);
    print(dataRes);
    /* if (response.statusCode == 200) {
      isLoading = false;
        notifyListeners();
        SharedPreferencesService(sf).setToken(dataRes["token"]);
        nextPageOnly(context!, page: LoginScreen());
        successSnackBar(context, dataRes["message"]);
    } else {
      isLoading = false;
      notifyListeners();
      errorSnackBar(context!, dataRes["message"]);
    } */
  }

//  //BuildContext? context,
  Future signUp(
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? confirmPassword,
    String? url,
    String? fileName,
    String? originalFileName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
     String? tokens = sf.getString("token");
    String url = "$baseUrl/auth/register";


    isLoading = true;
    notifyListeners();
    var response = await http.post(
      Uri.parse(url),
      body: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "url": url,
        "fileName": fileName,
        "originalFileName": originalFileName,
        "department": "Nurse",
      },
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens',
      },
    );
    print(response.body);
    print("=================================================");
    var dataRes = jsonDecode(response.body);
    print(dataRes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      isLoading = false;
        notifyListeners();;
        SharedPreferencesService(sf).setToken("");
        nextPageOnly(_context!, page: LoginScreen());
        successSnackBar(_context!, dataRes["message"]);
    } else {
      isLoading = false;
      notifyListeners();
      errorSnackBar(_context!, dataRes["message"]);
    }
  }

  Future login({
    String? email,
    String? password,
    BuildContext? context,
  }) async {
    isLoading = true;
    notifyListeners();
    String url = "$baseUrl/auth/login";
    SharedPreferences sf = await SharedPreferences.getInstance();

    var response = await http.post(
      Uri.parse(url),
      body: {
        "email": email,
        "password": password,
      },
      headers: {
        'Accept': 'application/json',
      },
    );

    var dataRes = jsonDecode(response.body);

    if (dataRes["success"] == false) {
      isLoading = false;
      notifyListeners();
      errorSnackBar(context!, "Username or password incorrect");
    } else if (dataRes["success"] == true) {
      isLoading = false;
      notifyListeners();
      SharedPreferencesService(sf).setToken(dataRes["token"]);
      print(dataRes["token"]);
      nextPageOnly(context!, page: const Placeholder());
      //nextPageOnly(context!, page: const MainLayout());
      successSnackBar(context, "Login Success");
    } else {
      isLoading = false;
      notifyListeners();
      errorSnackBar(context!, "Something went wrong");
    }
  }

  Future forgotPassword({
    String? email,
    BuildContext? context,
    bool isResend = false,
  }) async {
    isLoading = true;
    notifyListeners();
    String url = "$baseUrl/mail/forgotPassword";
    SharedPreferences sf = await SharedPreferences.getInstance();

    var response = await http.post(
      Uri.parse(url),
      body: {
        "email": email,
      },
      headers: {
        'Accept': 'application/json',
      },
    );
    print(response.body);
    var dataRes = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      isLoading = false;
      notifyListeners();
      SharedPreferencesService(sf).setToken(dataRes["token"]);
      if (isResend == true) {
        successSnackBar(context!, "Otp Sent Successfully");
      } else {
        nextPage(context!, page: VerifyForgotPasswordView(email!));
      }
      successSnackBar(context, "Otp Sent Successfully");
    } else {
      isLoading = false;
      notifyListeners();
      errorSnackBar(context!, dataRes["message"]);
    }
  }

  Future resetPassword({
    String? password,
    String? confirmPassword,
    BuildContext? context,
  }) async {
    isLoading = true;
    notifyListeners();
    String url = "$baseUrl/auth/resetPassword";
    SharedPreferences sf = await SharedPreferences.getInstance();
    String? tokens = sf.getString("token");

    var response = await http.post(
      Uri.parse(url),
      body: {
        "password": password,
        "confirmPassword": confirmPassword,
      },
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens',
      },
    );
    isLoading = false;
    notifyListeners();
    print(response.body);
    var dataRes = jsonDecode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      isLoading = false;
      notifyListeners();
      successSnackBar(context!, "Verification Successful");
      nextPageAndRemovePrevious(context, page: const LoginScreen());
    } else {
      isLoading = false;
      notifyListeners();

      errorSnackBar(context!, dataRes["message"]);
    } 
  }

  Future verifyEmail({
    BuildContext? context,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? confirmPassword,
    String? otp,
  }) async {
    isLoading = true;
    notifyListeners();
    String url = "$baseUrl/auth/verifyEmail";
    SharedPreferences sf = await SharedPreferences.getInstance();
    String? tokens = sf.getString("token");

    var response = await http.post(
      Uri.parse(url),
      body: {
        "email": email,
        "otp": otp,
      },
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
      successSnackBar(context!, "Email verification successful");
      nextPage(context!, page: UploadUserPhotoView(email!, firstName!,
        lastName!, password!, confirmPassword!));

    } else{
      isLoading = false;
      notifyListeners();
      errorSnackBar(context!, dataRes["message"]);
    }
  }

   Future verifyEmailForgotPassword({
    BuildContext? context,
    String? email,
    String? otp,
  }) async {
    isLoading = true;
    notifyListeners();
    String url = "$baseUrl/auth/verifyEmail";
    SharedPreferences sf = await SharedPreferences.getInstance();
    String? tokens = sf.getString("token");

    var response = await http.post(
      Uri.parse(url),
      body: {
        "email": email,
        "otp": otp,
      },
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
      successSnackBar(context!, "Email verification successful");
      nextPage(context!, page: ResetPassword());

    } else{
      isLoading = false;
      notifyListeners();
      errorSnackBar(context!, dataRes["message"]);
    }
  }

  Future setNewPassword({
    String? email,
    String? otp,
    BuildContext? context,
  }) async {
    isLoading = true;
    notifyListeners();
    String url = "https://staging-cafia-8ac864534ee4.herokuapp.com/api/auth/resetPassword";
    SharedPreferences sf = await SharedPreferences.getInstance();

    var response = await http.post(
      Uri.parse(url),
      body: {
        "email": email,
        "otp": otp,
      },
      headers: {
        'Accept': 'application/json',
      },
    );
    isLoading = false;
    notifyListeners();
    print(response.body);
    var dataRes = jsonDecode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      isLoading = false;
      notifyListeners();
      successSnackBar(context!, "Verification Successful");
      nextPageAndRemovePrevious(context, page: const LoginScreen());
    } else if (response.statusCode == 400) {
      isLoading = false;
      notifyListeners();

      errorSnackBar(context!, dataRes["message"]);
    } else {
      isLoading = false;
      notifyListeners();
      errorSnackBar(context!, "Something went wrong");
    }
  }
}
