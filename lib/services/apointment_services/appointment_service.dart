import 'dart:developer';
import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medicon/models/appointment.dart';
import 'package:medicon/models/time_range.dart';
import 'package:medicon/services/common/shared_preferences_service.dart';
import 'package:medicon/ui/components/snackbar.dart';
import 'package:medicon/utils/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentService with ChangeNotifier {
  bool isLoading = false;
  String status = "";
  String message = "";
  List<Appointment>? appointments;
  String baseUrl = "http://localhost:8000";
  //String baseUrl = "https://medicon-backend.vercel.app";

  AppointmentService(){
    appointments = [];
  }
  //BuildContext? _context;

  Future addApointment(String appointmentDate,
  int dayOfAppointment, int monthOfAppointment,
  int yearOfAppointment) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    String? userId = sf.getString("id");
    String day2 = getDay(monthOfAppointment);
    Appointment appointment = Appointment(
      appointmentDate, [], false, userId,
      dayOfAppointment, monthOfAppointment,
      yearOfAppointment, day2);
    appointments!.add(appointment);
    notifyListeners();
  }

  removeApointment(int selectedIndex){
    appointments!.removeAt(selectedIndex);
    notifyListeners();
  }

  addTimeRange(int appointmentIndex, TimeRange timeRange){
    appointments![appointmentIndex].timeRange!.add(timeRange);
    notifyListeners();
  }

  removeTimeRange(int appointmentIndex,int selectedTimeRangeIndex){
    appointments![appointmentIndex].timeRange!.removeAt(selectedTimeRangeIndex);
    notifyListeners();
  }

  updateStatusOfAppointment(int appointmentIndex, bool selectedAppointmentStatus){
    appointments![appointmentIndex].statusOfAppointment = selectedAppointmentStatus;
  }

  getDay2(int appointmentIndex){
    int day = appointments![appointmentIndex].dayOfAppointment!;
    print('day: $day');
    appointments![appointmentIndex].day2 = getDay(day);
    notifyListeners();
  }

  String getDay(int day) {
    String _day = "Sunday";

    switch(day){
      case 0:
      _day = "Sunday";
      case 1:
      _day = "Monday";
      case 2:
      _day = "Tuesday";
      case 3:
      _day = "Wednesday";
      case 4:
      _day = "Thursday";
      case 5:
      _day = "Friday";
      case 6:
      _day = "Saturday";
    }

    return _day;
  }
  
}
