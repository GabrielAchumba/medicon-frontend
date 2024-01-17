// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialty.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Specialty _$SpecialtyFromJson(Map<String, dynamic> json) => Specialty(
      json['anaesthesiology'] as bool?,
      json['audiologist'] as bool?,
      json['cardiacSurgery'] as bool?,
      json['cardiology'] as bool?,
      json['clinicalMicrobiology'] as bool?,
      json['userId'] as String?,
      json['isPending'] as bool?,
    );

Map<String, dynamic> _$SpecialtyToJson(Specialty instance) => <String, dynamic>{
      'anaesthesiology': instance.anaesthesiology,
      'audiologist': instance.audiologist,
      'cardiacSurgery': instance.cardiacSurgery,
      'cardiology': instance.cardiology,
      'clinicalMicrobiology': instance.clinicalMicrobiology,
      'userId': instance.userId,
      'isPending': instance.isPending,
    };
