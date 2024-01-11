import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl_standalone.dart';
import 'package:medicon/app.dart';
import 'package:medicon/local_storage.dart';
import 'locator.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    importance: Importance.high,
    enableVibration: true,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('en_US');

  // await CallKeep.setup();
  await findSystemLocale();
  setUp();
  await AppCache.init(); //Initialize Hive for Flutter
  await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    const ProviderScope(
      child:
      App(),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides{
  @override
 HttpClient createHttpClient(SecurityContext? context) { 
    return super.createHttpClient(context) 
    ..badCertificateCallback = (X509Certificate cert, String host, int port) => true; 
  }
}

