import 'dart:developer';
import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medicon/services/common/shared_preferences_service.dart';
import 'package:medicon/ui/components/snackbar.dart';
import 'package:medicon/ui/pages/auth/login.dart';
import 'package:medicon/ui/pages/auth/reset_password_screen.dart';
import 'package:medicon/ui/pages/auth/success.dart';
import 'package:medicon/ui/pages/auth/upload_user_photo.dart';
import 'package:medicon/ui/pages/auth/verify_email_view.dart';
import 'package:medicon/ui/pages/auth/verify_forgot_password.dart';
import 'package:medicon/ui/pages/auth/verify_view.dart';
import 'package:medicon/ui/pages/onboarding/welcome.dart';
import 'package:medicon/utils/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices with ChangeNotifier {
  bool isLoading = false;
  String status = "";
  String message = "";
  String baseUrl = "http://localhost:8000";
  //String baseUrl = "https://medicon-backend.vercel.app";
  late final Dio _dio;

  AuthServices() : _dio = Dio();
  //BuildContext? _context;

  Future sendOTPToEmail({
    BuildContext? context,
    String? email,
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
        nextPage(context!, page: VerifyEmailView(email!));
      }
      successSnackBar(context, dataRes["message"]);
    }else {
      isLoading = false;
      notifyListeners();
      String message = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
      errorSnackBar(context!, message);
    }
  }

  Future UploadFile({
    BuildContext? context,
    List<int>? imageBytes,
    String imageName = "",
  }) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    String url = "$baseUrl/gcp/upload";

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
      //await updateUser(url, fileName, originalFileName);
    }else{
      isLoading = false;
      notifyListeners();
      errorSnackBar(context!, response.data["error"]);
    }
  }

  Future signUp(
    {
    BuildContext? context,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? confirmPassword,
    String? gender,
    String? dateOfBirth,
  }) async {
    //print("gender: $gender");
    //print("dateOfBirth: $dateOfBirth");
    SharedPreferences sf = await SharedPreferences.getInstance();
     String? tokens = sf.getString("token");
    String url = "$baseUrl/auth/register";


    isLoading = true;
    notifyListeners();
    //"confirmPassword": confirmPassword,
    var response = await http.post(
      Uri.parse(url),
      body: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "gender": gender,
        "dateOfBirth": dateOfBirth,
        "department": "Nurse",
      },
      headers: {
        'Accept': 'application/json',
      },
    );
    print(response.body);
    print("=================================================");
    var dataRes = jsonDecode(response.body);
    print(dataRes);
    print("SEEN 1");
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("SEEN 2");
      isLoading = false;
        notifyListeners();;
        SharedPreferencesService(sf).setToken("");
        print("SEEN 3");
        nextPage(context!, page: SuccessScreen(email!));
        print("SEEN 4");
        successSnackBar(context!, dataRes["message"]);
    } else {
      isLoading = false;
      notifyListeners();
      String message = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
      errorSnackBar(context!, message);
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

    try {
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

      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading = false;
        notifyListeners();
        print(dataRes["token"]);
        print(dataRes["fullName"]);
        print(dataRes["email"]);
        print(dataRes["isOnbaordingPending"]);
        print(dataRes["id"]);
        SharedPreferencesService(sf).setToken(dataRes["token"]);
        SharedPreferencesService(sf).setUserDetails(dataRes["fullName"], 
        dataRes["email"], dataRes["isOnbaordingPending"],
        dataRes["id"]);
        String fullName = dataRes["fullName"];
        nextPageOnly(context!, page:  WelcomeScreen(fullName));
        successSnackBar(context, "Login Success");
      } else {
        isLoading = false;
        notifyListeners();
        String message = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
        errorSnackBar(context!, message);
      }
    } on Exception catch (exception) {
      log("Error 1 ${exception.toString()}");
    } catch (error) {
      log("Error 1 ${error.toString()}");
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
      String message = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
      errorSnackBar(context!, message);
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
      String message = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
      errorSnackBar(context!, message);
    }
  }

  Future verifyEmail({
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
      nextPage(context, page: LoginScreen());

    } else {
      isLoading = false;
      notifyListeners();
      String message = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
      errorSnackBar(context!, message);
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
    print("tokens: $tokens");

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
      nextPage(context, page: ResetPassword());

    } else {
      isLoading = false;
      notifyListeners();
      String message = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
      errorSnackBar(context!, message);
    }
  }
}
