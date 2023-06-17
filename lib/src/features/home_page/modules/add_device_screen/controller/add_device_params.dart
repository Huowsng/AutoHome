import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_device_params.freezed.dart';
part 'add_device_params.g.dart';

@freezed
abstract class AddDeviceParams with _$AddDeviceParams {
  factory AddDeviceParams({
    required String name,
    required String type,
    required String location,
    required String status,
  }) = _AddDeviceParams;

  factory AddDeviceParams.fromJson(Map<String, dynamic> json) => _$AddDeviceParamsFromJson(json);
}

