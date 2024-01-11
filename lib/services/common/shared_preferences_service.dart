import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesServiceProvider =
    Provider<SharedPreferencesService>((ref) => throw UnimplementedError());

class SharedPreferencesService {
  SharedPreferencesService(this.sharedPreferences);
  final SharedPreferences sharedPreferences;

  static const tokenKey = 'token';
  static const emailKey = 'email';
  static const fullNameKey = 'fullName';
  static const id = 'id';

  Future<void> setToken(String token) async {
    await sharedPreferences.setString(tokenKey, token);
    log(token);
    log(getToken());
  }

  Future<void> setUserDetails(String fullName, String email) async {
    await sharedPreferences.setString(emailKey, email);
    log(email);
    log(getEmail());
    await sharedPreferences.setString(fullNameKey, fullName);
    log(fullName);
    log(getFullName());
  }

  String getToken() => sharedPreferences.getString(tokenKey) ?? "";

  String getEmail() => sharedPreferences.getString(emailKey) ?? "";

  String getFullName() => sharedPreferences.getString(fullNameKey) ?? "";

  Future<void> setId(String tokon) async {
    await sharedPreferences.setString(id, tokon);
  }

  String getId() => sharedPreferences.getString(id) ?? "";
    static const onboardingCompleteKey = 'onboardingComplete';

  Future<void> setOnboardingComplete() async {
    await sharedPreferences.setBool(onboardingCompleteKey, true);
  }

  bool isOnboardingComplete() =>
      sharedPreferences.getBool(onboardingCompleteKey) ?? false;
}
