// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_device_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddDeviceParams _$$AddDeviceParamsFromJson(Map<String, dynamic> json) =>
    _$_AddDeviceParams(
      name: json['name'] as String,
      type: json['type'] as String,
      location: json['location'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$AddDeviceParamsToJson(_$_AddDeviceParams instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'location': instance.location,
      'status': instance.status,
    };
