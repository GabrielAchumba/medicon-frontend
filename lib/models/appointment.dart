import 'package:json_annotation/json_annotation.dart';
import 'package:medicon/models/time_range.dart';
part 'appointment.g.dart';

@JsonSerializable()
class Appointment {

  Appointment(this.dateOfAppointment, 
  this.timeRange, 
  this.statusOfAppointment,
  this.userId,
  this.dayOfAppointment,
  this.monthOfAppointment,
  this.yearOfAppointment,
  this.day2);

  String? dateOfAppointment;
  List<TimeRange>? timeRange;
  bool? statusOfAppointment;
  String? userId;
  int? dayOfAppointment;
  int? monthOfAppointment;
  int? yearOfAppointment;
  String? day2;

  factory Appointment.fromJson(Map<String, dynamic> json) => _$AppointmentFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
} 