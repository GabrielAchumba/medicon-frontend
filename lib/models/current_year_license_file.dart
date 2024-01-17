import 'package:json_annotation/json_annotation.dart';
part 'current_year_license_file.g.dart';

@JsonSerializable()
class CurrentYearLicenseFile {

  CurrentYearLicenseFile(this.url, 
  this.fileName, 
  this.originalFileName,
  this.userId,
  this.isPending);

  String? url;
  String? fileName;
  String? originalFileName;
  String? userId;
  bool? isPending;

  factory CurrentYearLicenseFile.fromJson(Map<String, dynamic> json) => _$CurrentYearLicenseFileFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentYearLicenseFileToJson(this);
} 