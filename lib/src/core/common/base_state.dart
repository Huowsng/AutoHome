import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_state.freezed.dart';

@freezed
class BaseState<T> with _$BaseState<T> {
  //init
  const factory BaseState.initial() = _BaseStateInitial<T>;
  const factory BaseState.loading() = _BaseStateLoading<T>;

  const factory BaseState.loaded(T data) = _BaseStateLoaded<T>;
  const factory BaseState.error([String? errorMessage]) = _BaseStateError<T>;
}
