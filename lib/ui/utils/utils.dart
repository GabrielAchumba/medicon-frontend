import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'country_cities.dart';
import 'db_categories.dart';

class Utils {
  static bool production = !false;
  static List toLocations(List<City> locations) => locations
      .map((City e) => {'city': e.city, 'country': e.country})
      .toList();
  static List toCategories(List<CategorySchema> categories) =>
      categories.map((e) => {'name': e.name, 'country': e.image}).toList();
  static List<MultipartFile> fileToFormDataValue(
      List<File> files, String name) {
    MultipartFile toMultipartFile(String path) =>
        MultipartFile.fromFileSync(path,
            filename: name +
                "-" +
                DateTime.now().millisecondsSinceEpoch.toString() +
                '.jpg');
    return files.map((File file) => toMultipartFile(file.path)).toList();
  }

  static void offKeyboard() async {
    await SystemChannels.textInput.invokeMethod<dynamic>('TextInput.hide');
  }

  static String? isValidPassword(String value) {
    value = value.trim();
    if (value.trim().isEmpty) {
      return "Password is required";
    } else if (value.trim().length < 6) {
      return "Password is too short";
    } else if (!value.trim().contains(RegExp(r'[0-9]'))) {
      return "Password must contain a number";
    } else if (!value.trim().toUpperCase().contains(RegExp(r'[A-Z]'))) {
      return "Password must contain a letter";
    }
    return null;
  }

  static String? isValidName(String value) {
    if (value.isEmpty) {
      return 'Field cannot be Empty';
    }
    return null;
  }

  static String? validateEmail(String value) {
    value = value.trim();
    final RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!regex.hasMatch(value)) {
      return 'Enter valid email';
    } else {
      return null;
    }
  }

  static String todaysDate(DateTime date) {
    return formatDate(date, [MM, ' ', dd]);
  }

  static String todaysTime() {
    return formatDate(DateTime.now(), [MM, ' ', dd]);
  }

  static String toDate(String date) {
    return formatDate(DateTime.parse(date), [MM, ' ', dd]);
  }

  static String toDateAlt(DateTime date) {
    return formatDate(date, [MM, ' ', dd]);
  }

  static void unfocusKeyboard(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
      return;
    }
    currentFocus.unfocus();
  }
}
