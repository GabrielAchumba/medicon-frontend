import 'package:json_annotation/json_annotation.dart';
part 'identity_verification_file.g.dart';

@JsonSerializable()
class IdentityVerificationFile {

  IdentityVerificationFile(this.url, 
  this.fileName, 
  this.originalFileName,
  this.userId,
  this.isPending);

  String? url;
  String? fileName;
  String? originalFileName;
  String? userId;
  bool? isPending;

  factory IdentityVerificationFile.fromJson(Map<String, dynamic> json) => _$IdentityVerificationFileFromJson(json);
  Map<String, dynamic> toJson() => _$IdentityVerificationFileToJson(this);
} 