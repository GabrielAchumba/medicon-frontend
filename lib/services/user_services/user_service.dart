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


class UserService with ChangeNotifier {
  bool isLoading = false;
  String status = "";
  String message = "";
  String baseUrl = "http://localhost:8000";
  //String baseUrl = "https://medicon-backend.vercel.app";
  late final Dio _dio;

  UserService() : _dio = Dio();

  Future updateUser({
    String? country,
    BuildContext? context,
  }) async {
    isLoading = true;
    notifyListeners();
    String url = "$baseUrl/user/update";
    SharedPreferences sf = await SharedPreferences.getInstance();
    String? tokens = sf.getString("token");

    var response = await http.post(
      Uri.parse(url),
      body: {
        "country": country,
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
      successSnackBar(context!, "Onbaording completed successfully");
      nextPageAndRemovePrevious(context, page: const LoginScreen());
    } else {
      isLoading = false;
      notifyListeners();
      String message = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
      errorSnackBar(context!, message);
    }
  }

}