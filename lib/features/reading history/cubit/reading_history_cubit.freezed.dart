// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reading_history_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReadingHistoryState {
  Status get status => throw _privateConstructorUsedError;
  List<ReadingHistoryModel> get historyModel =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReadingHistoryStateCopyWith<ReadingHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingHistoryStateCopyWith<$Res> {
  factory $ReadingHistoryStateCopyWith(
          ReadingHistoryState value, $Res Function(ReadingHistoryState) then) =
      _$ReadingHistoryStateCopyWithImpl<$Res, ReadingHistoryState>;
  @useResult
  $Res call(
      {Status status,
      List<ReadingHistoryModel> historyModel,
      String? errorMessage});
}

/// @nodoc
class _$ReadingHistoryStateCopyWithImpl<$Res, $Val extends ReadingHistoryState>
    implements $ReadingHistoryStateCopyWith<$Res> {
  _$ReadingHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? historyModel = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      historyModel: null == historyModel
          ? _value.historyModel
          : historyModel // ignore: cast_nullable_to_non_nullable
              as List<ReadingHistoryModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReadingHistoryStateCopyWith<$Res>
    implements $ReadingHistoryStateCopyWith<$Res> {
  factory _$$_ReadingHistoryStateCopyWith(_$_ReadingHistoryState value,
          $Res Function(_$_ReadingHistoryState) then) =
      __$$_ReadingHistoryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      List<ReadingHistoryModel> historyModel,
      String? errorMessage});
}

/// @nodoc
class __$$_ReadingHistoryStateCopyWithImpl<$Res>
    extends _$ReadingHistoryStateCopyWithImpl<$Res, _$_ReadingHistoryState>
    implements _$$_ReadingHistoryStateCopyWith<$Res> {
  __$$_ReadingHistoryStateCopyWithImpl(_$_ReadingHistoryState _value,
      $Res Function(_$_ReadingHistoryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? historyModel = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_ReadingHistoryState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      historyModel: null == historyModel
          ? _value._historyModel
          : historyModel // ignore: cast_nullable_to_non_nullable
              as List<ReadingHistoryModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ReadingHistoryState implements _ReadingHistoryState {
  const _$_ReadingHistoryState(
      {this.status = Status.initial,
      final List<ReadingHistoryModel> historyModel = const [],
      this.errorMessage})
      : _historyModel = historyModel;

  @override
  @JsonKey()
  final Status status;
  final List<ReadingHistoryModel> _historyModel;
  @override
  @JsonKey()
  List<ReadingHistoryModel> get historyModel {
    if (_historyModel is EqualUnmodifiableListView) return _historyModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_historyModel);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ReadingHistoryState(status: $status, historyModel: $historyModel, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReadingHistoryState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._historyModel, _historyModel) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_historyModel), errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReadingHistoryStateCopyWith<_$_ReadingHistoryState> get copyWith =>
      __$$_ReadingHistoryStateCopyWithImpl<_$_ReadingHistoryState>(
          this, _$identity);
}

abstract class _ReadingHistoryState implements ReadingHistoryState {
  const factory _ReadingHistoryState(
      {final Status status,
      final List<ReadingHistoryModel> historyModel,
      final String? errorMessage}) = _$_ReadingHistoryState;

  @override
  Status get status;
  @override
  List<ReadingHistoryModel> get historyModel;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ReadingHistoryStateCopyWith<_$_ReadingHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}
