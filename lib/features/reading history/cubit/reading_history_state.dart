part of 'reading_history_cubit.dart';

class ReadingHistoryState {
  ReadingHistoryState({
    this.status = Status.initial,
    this.historyModel = const [],
    this.errorMessage,
  });

  final Status status;
  final List<ReadingHistoryModel> historyModel;
  final String? errorMessage;
}
