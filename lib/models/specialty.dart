import 'package:json_annotation/json_annotation.dart';
part 'specialty.g.dart';

@JsonSerializable()
class Specialty {

  Specialty(this.anaesthesiology, 
  this.audiologist, 
  this.cardiacSurgery,
  this.cardiology,
  this.clinicalMicrobiology,
  this.userId,
  this.isPending);

  bool? anaesthesiology;
  bool? audiologist;
  bool? cardiacSurgery;
  bool? cardiology;
  bool? clinicalMicrobiology;
  String? userId;
  bool? isPending;

  factory Specialty.fromJson(Map<String, dynamic> json) => _$SpecialtyFromJson(json);
  Map<String, dynamic> toJson() => _$SpecialtyToJson(this);
} 