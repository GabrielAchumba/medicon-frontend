import 'package:json_annotation/json_annotation.dart';
part 'medical_registration_file.g.dart';

@JsonSerializable()
class MedicalRegistrationFile {

  MedicalRegistrationFile(this.url, 
  this.fileName, 
  this.originalFileName,
  this.userId,
  this.isPending);

  String? url;
  String? fileName;
  String? originalFileName;
  String? userId;
  bool? isPending;

  factory MedicalRegistrationFile.fromJson(Map<String, dynamic> json) => _$MedicalRegistrationFileFromJson(json);
  Map<String, dynamic> toJson() => _$MedicalRegistrationFileToJson(this);
} 