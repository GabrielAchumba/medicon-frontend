// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_registration_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRegistrationFile _$MedicalRegistrationFileFromJson(
        Map<String, dynamic> json) =>
    MedicalRegistrationFile(
      json['url'] as String?,
      json['fileName'] as String?,
      json['originalFileName'] as String?,
      json['userId'] as String?,
      json['isPending'] as bool?,
    );

Map<String, dynamic> _$MedicalRegistrationFileToJson(
        MedicalRegistrationFile instance) =>
    <String, dynamic>{
      'url': instance.url,
      'fileName': instance.fileName,
      'originalFileName': instance.originalFileName,
      'userId': instance.userId,
      'isPending': instance.isPending,
    };
