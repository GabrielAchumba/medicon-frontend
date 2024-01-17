// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_certificate_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdditionalCertificateFile _$AdditionalCertificateFileFromJson(
        Map<String, dynamic> json) =>
    AdditionalCertificateFile(
      json['url'] as String?,
      json['fileName'] as String?,
      json['originalFileName'] as String?,
      json['userId'] as String?,
      json['isPending'] as bool?,
    );

Map<String, dynamic> _$AdditionalCertificateFileToJson(
        AdditionalCertificateFile instance) =>
    <String, dynamic>{
      'url': instance.url,
      'fileName': instance.fileName,
      'originalFileName': instance.originalFileName,
      'userId': instance.userId,
      'isPending': instance.isPending,
    };
