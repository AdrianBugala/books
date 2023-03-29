part of 'remove_cubit.dart';

@freezed
class RemoveState with _$RemoveState {
  const factory RemoveState({
    @Default(false) bool remove,
    @Default(false) bool removnigErrorOccured,
  }) = _RemoveState;
}
