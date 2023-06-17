// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

@freezed
class Schedule with _$Schedule {
  factory Schedule({
    required String device,
    @JsonKey(name: 'devicestatus') required String deviceStatus,
    @JsonKey(name: 'timesettings') required String timeSetting,
  }) = ScheduleData;

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
}
