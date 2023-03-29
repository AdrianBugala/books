// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remove_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RemoveState {
  bool get remove => throw _privateConstructorUsedError;
  bool get removnigErrorOccured => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RemoveStateCopyWith<RemoveState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoveStateCopyWith<$Res> {
  factory $RemoveStateCopyWith(
          RemoveState value, $Res Function(RemoveState) then) =
      _$RemoveStateCopyWithImpl<$Res, RemoveState>;
  @useResult
  $Res call({bool remove, bool removnigErrorOccured});
}

/// @nodoc
class _$RemoveStateCopyWithImpl<$Res, $Val extends RemoveState>
    implements $RemoveStateCopyWith<$Res> {
  _$RemoveStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remove = null,
    Object? removnigErrorOccured = null,
  }) {
    return _then(_value.copyWith(
      remove: null == remove
          ? _value.remove
          : remove // ignore: cast_nullable_to_non_nullable
              as bool,
      removnigErrorOccured: null == removnigErrorOccured
          ? _value.removnigErrorOccured
          : removnigErrorOccured // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RemoveStateCopyWith<$Res>
    implements $RemoveStateCopyWith<$Res> {
  factory _$$_RemoveStateCopyWith(
          _$_RemoveState value, $Res Function(_$_RemoveState) then) =
      __$$_RemoveStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool remove, bool removnigErrorOccured});
}

/// @nodoc
class __$$_RemoveStateCopyWithImpl<$Res>
    extends _$RemoveStateCopyWithImpl<$Res, _$_RemoveState>
    implements _$$_RemoveStateCopyWith<$Res> {
  __$$_RemoveStateCopyWithImpl(
      _$_RemoveState _value, $Res Function(_$_RemoveState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remove = null,
    Object? removnigErrorOccured = null,
  }) {
    return _then(_$_RemoveState(
      remove: null == remove
          ? _value.remove
          : remove // ignore: cast_nullable_to_non_nullable
              as bool,
      removnigErrorOccured: null == removnigErrorOccured
          ? _value.removnigErrorOccured
          : removnigErrorOccured // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RemoveState implements _RemoveState {
  const _$_RemoveState(
      {this.remove = false, this.removnigErrorOccured = false});

  @override
  @JsonKey()
  final bool remove;
  @override
  @JsonKey()
  final bool removnigErrorOccured;

  @override
  String toString() {
    return 'RemoveState(remove: $remove, removnigErrorOccured: $removnigErrorOccured)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoveState &&
            (identical(other.remove, remove) || other.remove == remove) &&
            (identical(other.removnigErrorOccured, removnigErrorOccured) ||
                other.removnigErrorOccured == removnigErrorOccured));
  }

  @override
  int get hashCode => Object.hash(runtimeType, remove, removnigErrorOccured);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemoveStateCopyWith<_$_RemoveState> get copyWith =>
      __$$_RemoveStateCopyWithImpl<_$_RemoveState>(this, _$identity);
}

abstract class _RemoveState implements RemoveState {
  const factory _RemoveState(
      {final bool remove, final bool removnigErrorOccured}) = _$_RemoveState;

  @override
  bool get remove;
  @override
  bool get removnigErrorOccured;
  @override
  @JsonKey(ignore: true)
  _$$_RemoveStateCopyWith<_$_RemoveState> get copyWith =>
      throw _privateConstructorUsedError;
}
