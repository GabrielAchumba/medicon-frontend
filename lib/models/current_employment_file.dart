import 'package:json_annotation/json_annotation.dart';
part 'current_employment_file.g.dart';

@JsonSerializable()
class CurrentEmploymentFile {

  CurrentEmploymentFile(this.url, 
  this.fileName, 
  this.originalFileName,
  this.userId,
  this.dateStarted,
  this.isPending);

  String? url;
  String? fileName;
  String? originalFileName;
  String? userId;
  String? dateStarted;
  bool? isPending;

  factory CurrentEmploymentFile.fromJson(Map<String, dynamic> json) => _$CurrentEmploymentFileFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentEmploymentFileToJson(this);
} 