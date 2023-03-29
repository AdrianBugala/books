// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuoteState {
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  QuoteModel? get quoteModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuoteStateCopyWith<QuoteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteStateCopyWith<$Res> {
  factory $QuoteStateCopyWith(
          QuoteState value, $Res Function(QuoteState) then) =
      _$QuoteStateCopyWithImpl<$Res, QuoteState>;
  @useResult
  $Res call({Status status, String? errorMessage, QuoteModel? quoteModel});

  $QuoteModelCopyWith<$Res>? get quoteModel;
}

/// @nodoc
class _$QuoteStateCopyWithImpl<$Res, $Val extends QuoteState>
    implements $QuoteStateCopyWith<$Res> {
  _$QuoteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? quoteModel = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      quoteModel: freezed == quoteModel
          ? _value.quoteModel
          : quoteModel // ignore: cast_nullable_to_non_nullable
              as QuoteModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuoteModelCopyWith<$Res>? get quoteModel {
    if (_value.quoteModel == null) {
      return null;
    }

    return $QuoteModelCopyWith<$Res>(_value.quoteModel!, (value) {
      return _then(_value.copyWith(quoteModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_QuoteStateCopyWith<$Res>
    implements $QuoteStateCopyWith<$Res> {
  factory _$$_QuoteStateCopyWith(
          _$_QuoteState value, $Res Function(_$_QuoteState) then) =
      __$$_QuoteStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, String? errorMessage, QuoteModel? quoteModel});

  @override
  $QuoteModelCopyWith<$Res>? get quoteModel;
}

/// @nodoc
class __$$_QuoteStateCopyWithImpl<$Res>
    extends _$QuoteStateCopyWithImpl<$Res, _$_QuoteState>
    implements _$$_QuoteStateCopyWith<$Res> {
  __$$_QuoteStateCopyWithImpl(
      _$_QuoteState _value, $Res Function(_$_QuoteState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? quoteModel = freezed,
  }) {
    return _then(_$_QuoteState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      quoteModel: freezed == quoteModel
          ? _value.quoteModel
          : quoteModel // ignore: cast_nullable_to_non_nullable
              as QuoteModel?,
    ));
  }
}

/// @nodoc

class _$_QuoteState implements _QuoteState {
  const _$_QuoteState(
      {this.status = Status.initial, this.errorMessage, this.quoteModel});

  @override
  @JsonKey()
  final Status status;
  @override
  final String? errorMessage;
  @override
  final QuoteModel? quoteModel;

  @override
  String toString() {
    return 'QuoteState(status: $status, errorMessage: $errorMessage, quoteModel: $quoteModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuoteState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.quoteModel, quoteModel) ||
                other.quoteModel == quoteModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, errorMessage, quoteModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuoteStateCopyWith<_$_QuoteState> get copyWith =>
      __$$_QuoteStateCopyWithImpl<_$_QuoteState>(this, _$identity);
}

abstract class _QuoteState implements QuoteState {
  const factory _QuoteState(
      {final Status status,
      final String? errorMessage,
      final QuoteModel? quoteModel}) = _$_QuoteState;

  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  QuoteModel? get quoteModel;
  @override
  @JsonKey(ignore: true)
  _$$_QuoteStateCopyWith<_$_QuoteState> get copyWith =>
      throw _privateConstructorUsedError;
}
