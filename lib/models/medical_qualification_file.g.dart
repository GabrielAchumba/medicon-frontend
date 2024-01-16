// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_qualification_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalQualificationFile _$MedicalQualificationFileFromJson(
        Map<String, dynamic> json) =>
    MedicalQualificationFile(
      json['url'] as String?,
      json['fileName'] as String?,
      json['originalFileName'] as String?,
      json['yearOfMedicalQualification'] as String?,
      json['userId'] as String?,
      json['isPending'] as bool?,
    );

Map<String, dynamic> _$MedicalQualificationFileToJson(
        MedicalQualificationFile instance) =>
    <String, dynamic>{
      'url': instance.url,
      'fileName': instance.fileName,
      'originalFileName': instance.originalFileName,
      'yearOfMedicalQualification': instance.yearOfMedicalQualification,
      'userId': instance.userId,
      'isPending': instance.isPending,
    };
