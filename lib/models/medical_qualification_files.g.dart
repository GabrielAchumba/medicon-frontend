// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_qualification_files.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalQualificationFiles _$MedicalQualificationFilesFromJson(
        Map<String, dynamic> json) =>
    MedicalQualificationFiles()
      ..medicalQualificationFiles =
          (json['medicalQualificationFiles'] as List<dynamic>)
              .map((e) =>
                  MedicalQualificationFile.fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$MedicalQualificationFilesToJson(
        MedicalQualificationFiles instance) =>
    <String, dynamic>{
      'medicalQualificationFiles': instance.medicalQualificationFiles,
    };
