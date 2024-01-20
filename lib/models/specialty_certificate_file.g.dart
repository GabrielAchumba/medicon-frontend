// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialty_certificate_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialtyCertificateFile _$SpecialtyCertificateFileFromJson(
        Map<String, dynamic> json) =>
    SpecialtyCertificateFile(
      json['url'] as String?,
      json['fileName'] as String?,
      json['originalFileName'] as String?,
      json['userId'] as String?,
      json['isPending'] as bool?,
      json['specialty'] as String?,
    );

Map<String, dynamic> _$SpecialtyCertificateFileToJson(
        SpecialtyCertificateFile instance) =>
    <String, dynamic>{
      'url': instance.url,
      'fileName': instance.fileName,
      'originalFileName': instance.originalFileName,
      'userId': instance.userId,
      'isPending': instance.isPending,
      'specialty': instance.specialty,
    };
