import 'package:json_annotation/json_annotation.dart';
part 'time_range.g.dart';

@JsonSerializable()
class TimeRange {

  TimeRange(this.fromTime, 
  this.toTime);

  String? fromTime;
  String? toTime;

  factory TimeRange.fromJson(Map<String, dynamic> json) => _$TimeRangeFromJson(json);
  Map<String, dynamic> toJson() => _$TimeRangeToJson(this);
} 