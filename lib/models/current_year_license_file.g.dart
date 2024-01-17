// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_year_license_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentYearLicenseFile _$CurrentYearLicenseFileFromJson(
        Map<String, dynamic> json) =>
    CurrentYearLicenseFile(
      json['url'] as String?,
      json['fileName'] as String?,
      json['originalFileName'] as String?,
      json['userId'] as String?,
      json['isPending'] as bool?,
    );

Map<String, dynamic> _$CurrentYearLicenseFileToJson(
        CurrentYearLicenseFile instance) =>
    <String, dynamic>{
      'url': instance.url,
      'fileName': instance.fileName,
      'originalFileName': instance.originalFileName,
      'userId': instance.userId,
      'isPending': instance.isPending,
    };
