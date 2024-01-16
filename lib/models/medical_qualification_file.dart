import 'package:json_annotation/json_annotation.dart';
part 'medical_qualification_file.g.dart';

@JsonSerializable()
class MedicalQualificationFile {

  MedicalQualificationFile(this.url, 
  this.fileName, 
  this.originalFileName,
  this.yearOfMedicalQualification,
  this.userId,
  this.isPending);

  String? url;
  String? fileName;
  String? originalFileName;
  String? yearOfMedicalQualification;
  String? userId;
  bool? isPending;

  factory MedicalQualificationFile.fromJson(Map<String, dynamic> json) => _$MedicalQualificationFileFromJson(json);
  Map<String, dynamic> toJson() => _$MedicalQualificationFileToJson(this);
} 