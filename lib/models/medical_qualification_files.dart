import 'package:json_annotation/json_annotation.dart';
import 'package:medicon/models/medical_qualification_file.dart';
part 'medical_qualification_files.g.dart';

@JsonSerializable()

class MedicalQualificationFiles {

  MedicalQualificationFiles();

  late List<MedicalQualificationFile> medicalQualificationFiles;

  factory MedicalQualificationFiles.fromJson(Map<String, dynamic> json) => _$MedicalQualificationFilesFromJson(json);
  Map<String, dynamic> toJson() => _$MedicalQualificationFilesToJson(this);
}