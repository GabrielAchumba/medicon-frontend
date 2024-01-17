// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_verification_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdentityVerificationFile _$IdentityVerificationFileFromJson(
        Map<String, dynamic> json) =>
    IdentityVerificationFile(
      json['url'] as String?,
      json['fileName'] as String?,
      json['originalFileName'] as String?,
      json['userId'] as String?,
      json['isPending'] as bool?,
    );

Map<String, dynamic> _$IdentityVerificationFileToJson(
        IdentityVerificationFile instance) =>
    <String, dynamic>{
      'url': instance.url,
      'fileName': instance.fileName,
      'originalFileName': instance.originalFileName,
      'userId': instance.userId,
      'isPending': instance.isPending,
    };
