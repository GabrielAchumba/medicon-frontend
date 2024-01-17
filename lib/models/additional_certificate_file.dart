import 'package:json_annotation/json_annotation.dart';
part 'additional_certificate_file.g.dart';

@JsonSerializable()
class AdditionalCertificateFile {

  AdditionalCertificateFile(this.url, 
  this.fileName, 
  this.originalFileName,
  this.userId,
  this.isPending);

  String? url;
  String? fileName;
  String? originalFileName;
  String? userId;
  bool? isPending;

  factory AdditionalCertificateFile.fromJson(Map<String, dynamic> json) => _$AdditionalCertificateFileFromJson(json);
  Map<String, dynamic> toJson() => _$AdditionalCertificateFileToJson(this);
} 