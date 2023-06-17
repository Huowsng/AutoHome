// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_device_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddDeviceParams _$AddDeviceParamsFromJson(Map<String, dynamic> json) {
  return _AddDeviceParams.fromJson(json);
}

/// @nodoc
class _$AddDeviceParamsTearOff {
  const _$AddDeviceParamsTearOff();

  _AddDeviceParams call(
      {required String name,
      required String type,
      required String location,
      required String status}) {
    return _AddDeviceParams(
      name: name,
      type: type,
      location: location,
      status: status,
    );
  }

  AddDeviceParams fromJson(Map<String, Object?> json) {
    return AddDeviceParams.fromJson(json);
  }
}

/// @nodoc
const $AddDeviceParams = _$AddDeviceParamsTearOff();

/// @nodoc
mixin _$AddDeviceParams {
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddDeviceParamsCopyWith<AddDeviceParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddDeviceParamsCopyWith<$Res> {
  factory $AddDeviceParamsCopyWith(
          AddDeviceParams value, $Res Function(AddDeviceParams) then) =
      _$AddDeviceParamsCopyWithImpl<$Res>;
  $Res call({String name, String type, String location, String status});
}

/// @nodoc
class _$AddDeviceParamsCopyWithImpl<$Res>
    implements $AddDeviceParamsCopyWith<$Res> {
  _$AddDeviceParamsCopyWithImpl(this._value, this._then);

  final AddDeviceParams _value;
  // ignore: unused_field
  final $Res Function(AddDeviceParams) _then;

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
abstract class _$AddDeviceParamsCopyWith<$Res>
    implements $AddDeviceParamsCopyWith<$Res> {
  factory _$AddDeviceParamsCopyWith(
          _AddDeviceParams value, $Res Function(_AddDeviceParams) then) =
      __$AddDeviceParamsCopyWithImpl<$Res>;
  @override
  $Res call({String name, String type, String location, String status});
}

/// @nodoc
class __$AddDeviceParamsCopyWithImpl<$Res>
    extends _$AddDeviceParamsCopyWithImpl<$Res>
    implements _$AddDeviceParamsCopyWith<$Res> {
  __$AddDeviceParamsCopyWithImpl(
      _AddDeviceParams _value, $Res Function(_AddDeviceParams) _then)
      : super(_value, (v) => _then(v as _AddDeviceParams));

  @override
  _AddDeviceParams get _value => super._value as _AddDeviceParams;

  @override
  $Res call({
    Object? name = freezed,
    Object? type = freezed,
    Object? location = freezed,
    Object? status = freezed,
  }) {
    return _then(_AddDeviceParams(
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
class _$_AddDeviceParams implements _AddDeviceParams {
  _$_AddDeviceParams(
      {required this.name,
      required this.type,
      required this.location,
      required this.status});

  factory _$_AddDeviceParams.fromJson(Map<String, dynamic> json) =>
      _$$AddDeviceParamsFromJson(json);

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
    return 'AddDeviceParams(name: $name, type: $type, location: $location, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddDeviceParams &&
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
  _$AddDeviceParamsCopyWith<_AddDeviceParams> get copyWith =>
      __$AddDeviceParamsCopyWithImpl<_AddDeviceParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddDeviceParamsToJson(this);
  }
}

abstract class _AddDeviceParams implements AddDeviceParams {
  factory _AddDeviceParams(
      {required String name,
      required String type,
      required String location,
      required String status}) = _$_AddDeviceParams;

  factory _AddDeviceParams.fromJson(Map<String, dynamic> json) =
      _$_AddDeviceParams.fromJson;

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
  _$AddDeviceParamsCopyWith<_AddDeviceParams> get copyWith =>
      throw _privateConstructorUsedError;
}
