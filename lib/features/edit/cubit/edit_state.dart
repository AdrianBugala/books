part of 'edit_cubit.dart';

@freezed
class EditState with _$EditState {
  const factory EditState({
    @Default(false) bool saved,
    @Default('') String errorMessage,
  }) = _EditState;
}
