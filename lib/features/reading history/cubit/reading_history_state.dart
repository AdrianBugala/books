part of 'reading_history_cubit.dart';

@freezed
class ReadingHistoryState with _$ReadingHistoryState {
  const factory ReadingHistoryState({
    @Default(Status.initial) Status status,
    @Default([]) List<ReadingHistoryModel> historyModel,
    String? errorMessage,
  }) = _ReadingHistoryState;
}
