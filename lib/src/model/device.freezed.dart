// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return DeviceData.fromJson(json);
}

/// @nodoc
class _$DeviceTearOff {
  const _$DeviceTearOff();

  DeviceData call(
      {required String name,
      required String type,
      required String location,
      required String status}) {
    return DeviceData(
      name: name,
      type: type,
      location: location,
      status: status,
    );
  }

  Device fromJson(Map<String, Object?> json) {
    return Device.fromJson(json);
  }
}

/// @nodoc
const $Device = _$DeviceTearOff();

/// @nodoc
mixin _$Device {
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceCopyWith<Device> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceCopyWith<$Res> {
  factory $DeviceCopyWith(Device value, $Res Function(Device) then) =
      _$DeviceCopyWithImpl<$Res>;
  $Res call({String name, String type, String location, String status});
}

/// @nodoc
class _$DeviceCopyWithImpl<$Res> implements $DeviceCopyWith<$Res> {
  _$DeviceCopyWithImpl(this._value, this._then);

  final Device _value;
  // ignore: unused_field
  final $Res Function(Device) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? type = freezed,
    Object? location = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $DeviceDataCopyWith<$Res> implements $DeviceCopyWith<$Res> {
  factory $DeviceDataCopyWith(
          DeviceData value, $Res Function(DeviceData) then) =
      _$DeviceDataCopyWithImpl<$Res>;
  @override
  $Res call({String name, String type, String location, String status});
}

/// @nodoc
class _$DeviceDataCopyWithImpl<$Res> extends _$DeviceCopyWithImpl<$Res>
    implements $DeviceDataCopyWith<$Res> {
  _$DeviceDataCopyWithImpl(DeviceData _value, $Res Function(DeviceData) _then)
      : super(_value, (v) => _then(v as DeviceData));

  @override
  DeviceData get _value => super._value as DeviceData;

  @override
  $Res call({
    Object? name = freezed,
    Object? type = freezed,
    Object? location = freezed,
    Object? status = freezed,
  }) {
    return _then(DeviceData(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceData implements DeviceData {
  _$DeviceData(
      {required this.name,
      required this.type,
      required this.location,
      required this.status});

  factory _$DeviceData.fromJson(Map<String, dynamic> json) =>
      _$$DeviceDataFromJson(json);

  @override
  final String name;
  @override
  final String type;
  @override
  final String location;
  @override
  final String status;

  @override
  String toString() {
    return 'Device(name: $name, type: $type, location: $location, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceData &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  $DeviceDataCopyWith<DeviceData> get copyWith =>
      _$DeviceDataCopyWithImpl<DeviceData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceDataToJson(this);
  }
}

abstract class DeviceData implements Device {
  factory DeviceData(
      {required String name,
      required String type,
      required String location,
      required String status}) = _$DeviceData;

  factory DeviceData.fromJson(Map<String, dynamic> json) =
      _$DeviceData.fromJson;

  @override
  String get name;
  @override
  String get type;
  @override
  String get location;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  $DeviceDataCopyWith<DeviceData> get copyWith =>
      throw _privateConstructorUsedError;
}
