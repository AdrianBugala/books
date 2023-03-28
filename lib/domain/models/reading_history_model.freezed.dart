// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reading_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReadingHistoryModel {
  double get currentPage => throw _privateConstructorUsedError;
  double get lastPage => throw _privateConstructorUsedError;
  double get pagesRead => throw _privateConstructorUsedError;
  DateTime get dateAdded => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReadingHistoryModelCopyWith<ReadingHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingHistoryModelCopyWith<$Res> {
  factory $ReadingHistoryModelCopyWith(
          ReadingHistoryModel value, $Res Function(ReadingHistoryModel) then) =
      _$ReadingHistoryModelCopyWithImpl<$Res, ReadingHistoryModel>;
  @useResult
  $Res call(
      {double currentPage,
      double lastPage,
      double pagesRead,
      DateTime dateAdded});
}

/// @nodoc
class _$ReadingHistoryModelCopyWithImpl<$Res, $Val extends ReadingHistoryModel>
    implements $ReadingHistoryModelCopyWith<$Res> {
  _$ReadingHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? pagesRead = null,
    Object? dateAdded = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as double,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as double,
      pagesRead: null == pagesRead
          ? _value.pagesRead
          : pagesRead // ignore: cast_nullable_to_non_nullable
              as double,
      dateAdded: null == dateAdded
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReadingHistoryModelCopyWith<$Res>
    implements $ReadingHistoryModelCopyWith<$Res> {
  factory _$$_ReadingHistoryModelCopyWith(_$_ReadingHistoryModel value,
          $Res Function(_$_ReadingHistoryModel) then) =
      __$$_ReadingHistoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double currentPage,
      double lastPage,
      double pagesRead,
      DateTime dateAdded});
}

/// @nodoc
class __$$_ReadingHistoryModelCopyWithImpl<$Res>
    extends _$ReadingHistoryModelCopyWithImpl<$Res, _$_ReadingHistoryModel>
    implements _$$_ReadingHistoryModelCopyWith<$Res> {
  __$$_ReadingHistoryModelCopyWithImpl(_$_ReadingHistoryModel _value,
      $Res Function(_$_ReadingHistoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? pagesRead = null,
    Object? dateAdded = null,
  }) {
    return _then(_$_ReadingHistoryModel(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as double,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as double,
      pagesRead: null == pagesRead
          ? _value.pagesRead
          : pagesRead // ignore: cast_nullable_to_non_nullable
              as double,
      dateAdded: null == dateAdded
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_ReadingHistoryModel extends _ReadingHistoryModel {
  const _$_ReadingHistoryModel(
      {required this.currentPage,
      required this.lastPage,
      required this.pagesRead,
      required this.dateAdded})
      : super._();

  @override
  final double currentPage;
  @override
  final double lastPage;
  @override
  final double pagesRead;
  @override
  final DateTime dateAdded;

  @override
  String toString() {
    return 'ReadingHistoryModel(currentPage: $currentPage, lastPage: $lastPage, pagesRead: $pagesRead, dateAdded: $dateAdded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReadingHistoryModel &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.pagesRead, pagesRead) ||
                other.pagesRead == pagesRead) &&
            (identical(other.dateAdded, dateAdded) ||
                other.dateAdded == dateAdded));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, lastPage, pagesRead, dateAdded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReadingHistoryModelCopyWith<_$_ReadingHistoryModel> get copyWith =>
      __$$_ReadingHistoryModelCopyWithImpl<_$_ReadingHistoryModel>(
          this, _$identity);
}

abstract class _ReadingHistoryModel extends ReadingHistoryModel {
  const factory _ReadingHistoryModel(
      {required final double currentPage,
      required final double lastPage,
      required final double pagesRead,
      required final DateTime dateAdded}) = _$_ReadingHistoryModel;
  const _ReadingHistoryModel._() : super._();

  @override
  double get currentPage;
  @override
  double get lastPage;
  @override
  double get pagesRead;
  @override
  DateTime get dateAdded;
  @override
  @JsonKey(ignore: true)
  _$$_ReadingHistoryModelCopyWith<_$_ReadingHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
