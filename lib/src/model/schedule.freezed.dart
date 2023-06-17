// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return ScheduleData.fromJson(json);
}

/// @nodoc
class _$ScheduleTearOff {
  const _$ScheduleTearOff();

  ScheduleData call(
      {required String device,
      @JsonKey(name: 'devicestatus') required String deviceStatus,
      @JsonKey(name: 'timesettings') required String timeSetting}) {
    return ScheduleData(
      device: device,
      deviceStatus: deviceStatus,
      timeSetting: timeSetting,
    );
  }

  Schedule fromJson(Map<String, Object?> json) {
    return Schedule.fromJson(json);
  }
}

/// @nodoc
const $Schedule = _$ScheduleTearOff();

/// @nodoc
mixin _$Schedule {
  String get device => throw _privateConstructorUsedError;
  @JsonKey(name: 'devicestatus')
  String get deviceStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'timesettings')
  String get timeSetting => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleCopyWith<Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleCopyWith<$Res> {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) then) =
      _$ScheduleCopyWithImpl<$Res>;
  $Res call(
      {String device,
      @JsonKey(name: 'devicestatus') String deviceStatus,
      @JsonKey(name: 'timesettings') String timeSetting});
}

/// @nodoc
class _$ScheduleCopyWithImpl<$Res> implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._value, this._then);

  final Schedule _value;
  // ignore: unused_field
  final $Res Function(Schedule) _then;

  @override
  $Res call({
    Object? device = freezed,
    Object? deviceStatus = freezed,
    Object? timeSetting = freezed,
  }) {
    return _then(_value.copyWith(
      device: device == freezed
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String,
      deviceStatus: deviceStatus == freezed
          ? _value.deviceStatus
          : deviceStatus // ignore: cast_nullable_to_non_nullable
              as String,
      timeSetting: timeSetting == freezed
          ? _value.timeSetting
          : timeSetting // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $ScheduleDataCopyWith<$Res> implements $ScheduleCopyWith<$Res> {
  factory $ScheduleDataCopyWith(
          ScheduleData value, $Res Function(ScheduleData) then) =
      _$ScheduleDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String device,
      @JsonKey(name: 'devicestatus') String deviceStatus,
      @JsonKey(name: 'timesettings') String timeSetting});
}

/// @nodoc
class _$ScheduleDataCopyWithImpl<$Res> extends _$ScheduleCopyWithImpl<$Res>
    implements $ScheduleDataCopyWith<$Res> {
  _$ScheduleDataCopyWithImpl(
      ScheduleData _value, $Res Function(ScheduleData) _then)
      : super(_value, (v) => _then(v as ScheduleData));

  @override
  ScheduleData get _value => super._value as ScheduleData;

  @override
  $Res call({
    Object? device = freezed,
    Object? deviceStatus = freezed,
    Object? timeSetting = freezed,
  }) {
    return _then(ScheduleData(
      device: device == freezed
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String,
      deviceStatus: deviceStatus == freezed
          ? _value.deviceStatus
          : deviceStatus // ignore: cast_nullable_to_non_nullable
              as String,
      timeSetting: timeSetting == freezed
          ? _value.timeSetting
          : timeSetting // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleData implements ScheduleData {
  _$ScheduleData(
      {required this.device,
      @JsonKey(name: 'devicestatus') required this.deviceStatus,
      @JsonKey(name: 'timesettings') required this.timeSetting});

  factory _$ScheduleData.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleDataFromJson(json);

  @override
  final String device;
  @override
  @JsonKey(name: 'devicestatus')
  final String deviceStatus;
  @override
  @JsonKey(name: 'timesettings')
  final String timeSetting;

  @override
  String toString() {
    return 'Schedule(device: $device, deviceStatus: $deviceStatus, timeSetting: $timeSetting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScheduleData &&
            const DeepCollectionEquality().equals(other.device, device) &&
            const DeepCollectionEquality()
                .equals(other.deviceStatus, deviceStatus) &&
            const DeepCollectionEquality()
                .equals(other.timeSetting, timeSetting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(device),
      const DeepCollectionEquality().hash(deviceStatus),
      const DeepCollectionEquality().hash(timeSetting));

  @JsonKey(ignore: true)
  @override
  $ScheduleDataCopyWith<ScheduleData> get copyWith =>
      _$ScheduleDataCopyWithImpl<ScheduleData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleDataToJson(this);
  }
}

abstract class ScheduleData implements Schedule {
  factory ScheduleData(
          {required String device,
          @JsonKey(name: 'devicestatus') required String deviceStatus,
          @JsonKey(name: 'timesettings') required String timeSetting}) =
      _$ScheduleData;

  factory ScheduleData.fromJson(Map<String, dynamic> json) =
      _$ScheduleData.fromJson;

  @override
  String get device;
  @override
  @JsonKey(name: 'devicestatus')
  String get deviceStatus;
  @override
  @JsonKey(name: 'timesettings')
  String get timeSetting;
  @override
  @JsonKey(ignore: true)
  $ScheduleDataCopyWith<ScheduleData> get copyWith =>
      throw _privateConstructorUsedError;
}
