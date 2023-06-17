// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'base_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BaseStateTearOff {
  const _$BaseStateTearOff();

  _BaseStateInitial<T> initial<T>() {
    return _BaseStateInitial<T>();
  }

  _BaseStateLoading<T> loading<T>() {
    return _BaseStateLoading<T>();
  }

  _BaseStateLoaded<T> loaded<T>(T data) {
    return _BaseStateLoaded<T>(
      data,
    );
  }

  _BaseStateError<T> error<T>([String? errorMessage]) {
    return _BaseStateError<T>(
      errorMessage,
    );
  }
}

/// @nodoc
const $BaseState = _$BaseStateTearOff();

/// @nodoc
mixin _$BaseState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String? errorMessage) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String? errorMessage)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String? errorMessage)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BaseStateInitial<T> value) initial,
    required TResult Function(_BaseStateLoading<T> value) loading,
    required TResult Function(_BaseStateLoaded<T> value) loaded,
    required TResult Function(_BaseStateError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_BaseStateInitial<T> value)? initial,
    TResult Function(_BaseStateLoading<T> value)? loading,
    TResult Function(_BaseStateLoaded<T> value)? loaded,
    TResult Function(_BaseStateError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BaseStateInitial<T> value)? initial,
    TResult Function(_BaseStateLoading<T> value)? loading,
    TResult Function(_BaseStateLoaded<T> value)? loaded,
    TResult Function(_BaseStateError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseStateCopyWith<T, $Res> {
  factory $BaseStateCopyWith(
          BaseState<T> value, $Res Function(BaseState<T>) then) =
      _$BaseStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$BaseStateCopyWithImpl<T, $Res> implements $BaseStateCopyWith<T, $Res> {
  _$BaseStateCopyWithImpl(this._value, this._then);

  final BaseState<T> _value;
  // ignore: unused_field
  final $Res Function(BaseState<T>) _then;
}

/// @nodoc
abstract class _$BaseStateInitialCopyWith<T, $Res> {
  factory _$BaseStateInitialCopyWith(_BaseStateInitial<T> value,
          $Res Function(_BaseStateInitial<T>) then) =
      __$BaseStateInitialCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$BaseStateInitialCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res>
    implements _$BaseStateInitialCopyWith<T, $Res> {
  __$BaseStateInitialCopyWithImpl(
      _BaseStateInitial<T> _value, $Res Function(_BaseStateInitial<T>) _then)
      : super(_value, (v) => _then(v as _BaseStateInitial<T>));

  @override
  _BaseStateInitial<T> get _value => super._value as _BaseStateInitial<T>;
}

/// @nodoc

class _$_BaseStateInitial<T> implements _BaseStateInitial<T> {
  const _$_BaseStateInitial();

  @override
  String toString() {
    return 'BaseState<$T>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _BaseStateInitial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String? errorMessage) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String? errorMessage)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String? errorMessage)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BaseStateInitial<T> value) initial,
    required TResult Function(_BaseStateLoading<T> value) loading,
    required TResult Function(_BaseStateLoaded<T> value) loaded,
    required TResult Function(_BaseStateError<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_BaseStateInitial<T> value)? initial,
    TResult Function(_BaseStateLoading<T> value)? loading,
    TResult Function(_BaseStateLoaded<T> value)? loaded,
    TResult Function(_BaseStateError<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BaseStateInitial<T> value)? initial,
    TResult Function(_BaseStateLoading<T> value)? loading,
    TResult Function(_BaseStateLoaded<T> value)? loaded,
    TResult Function(_BaseStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _BaseStateInitial<T> implements BaseState<T> {
  const factory _BaseStateInitial() = _$_BaseStateInitial<T>;
}

/// @nodoc
abstract class _$BaseStateLoadingCopyWith<T, $Res> {
  factory _$BaseStateLoadingCopyWith(_BaseStateLoading<T> value,
          $Res Function(_BaseStateLoading<T>) then) =
      __$BaseStateLoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$BaseStateLoadingCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res>
    implements _$BaseStateLoadingCopyWith<T, $Res> {
  __$BaseStateLoadingCopyWithImpl(
      _BaseStateLoading<T> _value, $Res Function(_BaseStateLoading<T>) _then)
      : super(_value, (v) => _then(v as _BaseStateLoading<T>));

  @override
  _BaseStateLoading<T> get _value => super._value as _BaseStateLoading<T>;
}

/// @nodoc

class _$_BaseStateLoading<T> implements _BaseStateLoading<T> {
  const _$_BaseStateLoading();

  @override
  String toString() {
    return 'BaseState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _BaseStateLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String? errorMessage) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String? errorMessage)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String? errorMessage)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BaseStateInitial<T> value) initial,
    required TResult Function(_BaseStateLoading<T> value) loading,
    required TResult Function(_BaseStateLoaded<T> value) loaded,
    required TResult Function(_BaseStateError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_BaseStateInitial<T> value)? initial,
    TResult Function(_BaseStateLoading<T> value)? loading,
    TResult Function(_BaseStateLoaded<T> value)? loaded,
    TResult Function(_BaseStateError<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BaseStateInitial<T> value)? initial,
    TResult Function(_BaseStateLoading<T> value)? loading,
    TResult Function(_BaseStateLoaded<T> value)? loaded,
    TResult Function(_BaseStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _BaseStateLoading<T> implements BaseState<T> {
  const factory _BaseStateLoading() = _$_BaseStateLoading<T>;
}

/// @nodoc
abstract class _$BaseStateLoadedCopyWith<T, $Res> {
  factory _$BaseStateLoadedCopyWith(
          _BaseStateLoaded<T> value, $Res Function(_BaseStateLoaded<T>) then) =
      __$BaseStateLoadedCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class __$BaseStateLoadedCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res>
    implements _$BaseStateLoadedCopyWith<T, $Res> {
  __$BaseStateLoadedCopyWithImpl(
      _BaseStateLoaded<T> _value, $Res Function(_BaseStateLoaded<T>) _then)
      : super(_value, (v) => _then(v as _BaseStateLoaded<T>));

  @override
  _BaseStateLoaded<T> get _value => super._value as _BaseStateLoaded<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_BaseStateLoaded<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_BaseStateLoaded<T> implements _BaseStateLoaded<T> {
  const _$_BaseStateLoaded(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'BaseState<$T>.loaded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BaseStateLoaded<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$BaseStateLoadedCopyWith<T, _BaseStateLoaded<T>> get copyWith =>
      __$BaseStateLoadedCopyWithImpl<T, _BaseStateLoaded<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String? errorMessage) error,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String? errorMessage)? error,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String? errorMessage)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BaseStateInitial<T> value) initial,
    required TResult Function(_BaseStateLoading<T> value) loading,
    required TResult Function(_BaseStateLoaded<T> value) loaded,
    required TResult Function(_BaseStateError<T> value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_BaseStateInitial<T> value)? initial,
    TResult Function(_BaseStateLoading<T> value)? loading,
    TResult Function(_BaseStateLoaded<T> value)? loaded,
    TResult Function(_BaseStateError<T> value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BaseStateInitial<T> value)? initial,
    TResult Function(_BaseStateLoading<T> value)? loading,
    TResult Function(_BaseStateLoaded<T> value)? loaded,
    TResult Function(_BaseStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _BaseStateLoaded<T> implements BaseState<T> {
  const factory _BaseStateLoaded(T data) = _$_BaseStateLoaded<T>;

  T get data;
  @JsonKey(ignore: true)
  _$BaseStateLoadedCopyWith<T, _BaseStateLoaded<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BaseStateErrorCopyWith<T, $Res> {
  factory _$BaseStateErrorCopyWith(
          _BaseStateError<T> value, $Res Function(_BaseStateError<T>) then) =
      __$BaseStateErrorCopyWithImpl<T, $Res>;
  $Res call({String? errorMessage});
}

/// @nodoc
class __$BaseStateErrorCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res>
    implements _$BaseStateErrorCopyWith<T, $Res> {
  __$BaseStateErrorCopyWithImpl(
      _BaseStateError<T> _value, $Res Function(_BaseStateError<T>) _then)
      : super(_value, (v) => _then(v as _BaseStateError<T>));

  @override
  _BaseStateError<T> get _value => super._value as _BaseStateError<T>;

  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_BaseStateError<T>(
      errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_BaseStateError<T> implements _BaseStateError<T> {
  const _$_BaseStateError([this.errorMessage]);

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'BaseState<$T>.error(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BaseStateError<T> &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$BaseStateErrorCopyWith<T, _BaseStateError<T>> get copyWith =>
      __$BaseStateErrorCopyWithImpl<T, _BaseStateError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String? errorMessage) error,
  }) {
    return error(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String? errorMessage)? error,
  }) {
    return error?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String? errorMessage)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BaseStateInitial<T> value) initial,
    required TResult Function(_BaseStateLoading<T> value) loading,
    required TResult Function(_BaseStateLoaded<T> value) loaded,
    required TResult Function(_BaseStateError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_BaseStateInitial<T> value)? initial,
    TResult Function(_BaseStateLoading<T> value)? loading,
    TResult Function(_BaseStateLoaded<T> value)? loaded,
    TResult Function(_BaseStateError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BaseStateInitial<T> value)? initial,
    TResult Function(_BaseStateLoading<T> value)? loading,
    TResult Function(_BaseStateLoaded<T> value)? loaded,
    TResult Function(_BaseStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BaseStateError<T> implements BaseState<T> {
  const factory _BaseStateError([String? errorMessage]) = _$_BaseStateError<T>;

  String? get errorMessage;
  @JsonKey(ignore: true)
  _$BaseStateErrorCopyWith<T, _BaseStateError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
