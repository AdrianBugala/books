import 'package:intl/intl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reading_history_model.freezed.dart';

@freezed
class ReadingHistoryModel with _$ReadingHistoryModel {
  const ReadingHistoryModel._();

  const factory ReadingHistoryModel({
    required double currentPage,
    required double lastPage,
    required double pagesRead,
    required DateTime dateAdded,
  }) = _ReadingHistoryModel;

  String get dateAddedFormatted {
    return DateFormat.yMMMd().format(dateAdded);
  }
}
