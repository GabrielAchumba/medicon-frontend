// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
      json['dateOfAppointment'] as String?,
      (json['timeRange'] as List<dynamic>?)
          ?.map((e) => TimeRange.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['statusOfAppointment'] as bool?,
      json['userId'] as String?,
      json['dayOfAppointment'] as int?,
      json['monthOfAppointment'] as int?,
      json['yearOfAppointment'] as int?,
      json['day2'] as String?,
    );

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'dateOfAppointment': instance.dateOfAppointment,
      'timeRange': instance.timeRange,
      'statusOfAppointment': instance.statusOfAppointment,
      'userId': instance.userId,
      'dayOfAppointment': instance.dayOfAppointment,
      'monthOfAppointment': instance.monthOfAppointment,
      'yearOfAppointment': instance.yearOfAppointment,
      'day2': instance.day2,
    };
