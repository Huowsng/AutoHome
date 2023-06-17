import 'package:freezed_annotation/freezed_annotation.dart';

part 'device.freezed.dart';
part 'device.g.dart';

@freezed
class Device with _$Device {
  factory Device({
    required String name,
    required String type,
    required String location,
    required String status,
  }) = DeviceData;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
}


