import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiProvider with ChangeNotifier {
  bool isLoading = false;
  dynamic requests;
  Future getDashBoardRequest() async {
    isLoading = true;
    SharedPreferences sf = await SharedPreferences.getInstance();
    String? tokens = sf.getString("token");
    const api = 'https://staging-cafia-8ac864534ee4.herokuapp.com/api/request/index';

    http.Response response = await http.get(
      Uri.parse(api),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens',
      },
    );

    var data = jsonDecode(response.body);
    requests = data["data"]["requests"];
    print(requests["data"]["requests"].length);
    isLoading = false;
    notifyListeners();

    return data;
  }

  Future makeRequest({Map<String, dynamic>? body}) async {
    // isLoading = true;
    SharedPreferences sf = await SharedPreferences.getInstance();
    String? tokens = sf.getString("token");
    const api = 'https://staging-cafia-8ac864534ee4.herokuapp.com/api/request/store';

    http.Response response = await http.post(
      Uri.parse(api),
      body: body,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens',
      },
    );

    var data = jsonDecode(response.body);
    print("Chima ${response.body}");
    isLoading = false;
    notifyListeners();

    return data;
  }
}
