import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService with ChangeNotifier {
  bool isLoadingProfile = false;
  int requestCount = 0;
  int myResponseCount = 0;
  dynamic userProfile;
  // int count = 1;

  total() {
    int total = requestCount + myResponseCount;
    return total;
  }

  getTotal() {
    total();
    notifyListeners();
  }

  getUserProfile() async {
    isLoadingProfile = true;
    notifyListeners();
    SharedPreferences sf = await SharedPreferences.getInstance();
    String? token = sf.getString("token");
    var response = await http.get(
      Uri.parse("https://staging-cafia-8ac864534ee4.herokuapp.com/api/user/show"),
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    var data = jsonDecode(response.body)["data"];
    print(
      data["location"]["city"],
    );

    userProfile = data;
    isLoadingProfile = false;
    notifyListeners();
    return data;
  }

  storeUserProfile(Map<String, dynamic> body) async {
    isLoadingProfile = true;
    notifyListeners();
    SharedPreferences sf = await SharedPreferences.getInstance();
    String? token = sf.getString("token");
    var response = await http.post(
      Uri.parse("https://staging-cafia-8ac864534ee4.herokuapp.com/api/user/store"),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: body,
    );
    print("chima ${response.body}");
    isLoadingProfile = false;
    notifyListeners();
  }

  Future getMyRequestCount() async {
    isLoadingProfile = true;

    try {
      const api = 'https://staging-cafia-8ac864534ee4.herokuapp.com/api/request/myindex';
      SharedPreferences sf = await SharedPreferences.getInstance();
      String? tokens = sf.getString("token");

      http.Response response = await http.get(
        Uri.parse(api),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokens',
        },
      );

      isLoadingProfile = false;
      notifyListeners();
      var data = json.decode(response.body)["data"];

      var count = data["requests"].length;
      requestCount = count;
      print(requestCount);
      notifyListeners();
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future fetchRequest() async {
    isLoadingProfile = true;

    try {
      const api = 'https://staging-cafia-8ac864534ee4.herokuapp.com/api/response/myindex';
      SharedPreferences sf = await SharedPreferences.getInstance();
      String? tokens = sf.getString("token");
      http.Response response = await http.get(
        Uri.parse(api),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokens',
        },
      );
      isLoadingProfile = false;
      notifyListeners();
      final result = jsonDecode(response.body)["data"];
      myResponseCount = jsonDecode(response.body)["data"]["totalUnreadMessages"];
      notifyListeners();
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
