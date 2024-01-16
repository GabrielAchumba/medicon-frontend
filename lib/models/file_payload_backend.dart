import 'package:json_annotation/json_annotation.dart';
part 'file_payload_backend.g.dart';

@JsonSerializable()
class FilePayloadBackend {

  FilePayloadBackend(this.url, this.fileName, this.originalFileName);

  String url;
  String fileName;
  String originalFileName;

  factory FilePayloadBackend.fromJson(Map<String, dynamic> json) => _$FilePayloadBackendFromJson(json);
  Map<String, dynamic> toJson() => _$FilePayloadBackendToJson(this);

}