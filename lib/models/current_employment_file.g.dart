// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_employment_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentEmploymentFile _$CurrentEmploymentFileFromJson(
        Map<String, dynamic> json) =>
    CurrentEmploymentFile(
      json['url'] as String?,
      json['fileName'] as String?,
      json['originalFileName'] as String?,
      json['userId'] as String?,
      json['dateStarted'] as String?,
      json['isPending'] as bool?,
    );

Map<String, dynamic> _$CurrentEmploymentFileToJson(
        CurrentEmploymentFile instance) =>
    <String, dynamic>{
      'url': instance.url,
      'fileName': instance.fileName,
      'originalFileName': instance.originalFileName,
      'userId': instance.userId,
      'dateStarted': instance.dateStarted,
      'isPending': instance.isPending,
    };
