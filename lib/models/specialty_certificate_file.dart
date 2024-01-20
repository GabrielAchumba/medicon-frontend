import 'package:json_annotation/json_annotation.dart';
part 'specialty_certificate_file.g.dart';

@JsonSerializable()
class SpecialtyCertificateFile {

  SpecialtyCertificateFile(this.url, 
  this.fileName, 
  this.originalFileName,
  this.userId,
  this.isPending,
  this.specialty);

  String? url;
  String? fileName;
  String? originalFileName;
  String? userId;
  bool? isPending;
  String? specialty;

  factory SpecialtyCertificateFile.fromJson(Map<String, dynamic> json) => _$SpecialtyCertificateFileFromJson(json);
  Map<String, dynamic> toJson() => _$SpecialtyCertificateFileToJson(this);
} 