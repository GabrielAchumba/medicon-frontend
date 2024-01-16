// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_payload_backend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilePayloadBackend _$FilePayloadBackendFromJson(Map<String, dynamic> json) =>
    FilePayloadBackend(
      json['url'] as String,
      json['fileName'] as String,
      json['originalFileName'] as String,
    );

Map<String, dynamic> _$FilePayloadBackendToJson(FilePayloadBackend instance) =>
    <String, dynamic>{
      'url': instance.url,
      'fileName': instance.fileName,
      'originalFileName': instance.originalFileName,
    };
