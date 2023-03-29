part of 'add_cubit.dart';

@freezed
class AddState with _$AddState {
  const factory AddState({
    @Default(false) bool saved,
    @Default('') String errorMessage,
  }) = _AddState;
}
