// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleData _$$ScheduleDataFromJson(Map<String, dynamic> json) =>
    _$ScheduleData(
      device: json['device'] as String,
      deviceStatus: json['devicestatus'] as String,
      timeSetting: json['timesettings'] as String,
    );

Map<String, dynamic> _$$ScheduleDataToJson(_$ScheduleData instance) =>
    <String, dynamic>{
      'device': instance.device,
      'devicestatus': instance.deviceStatus,
      'timesettings': instance.timeSetting,
    };
