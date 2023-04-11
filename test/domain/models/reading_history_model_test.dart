import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:my_books/domain/models/reading_history_model.dart';

void main() {
  test('should getter dateAddedFormatted return date with nice format', () {
    // 1
    final model = ReadingHistoryModel(
      currentPage: 0,
      lastPage: 0,
      pagesRead: 0,
      dateAdded: DateTime.now(),
    );
    // 2
    final result = model.dateAddedFormatted;

    // 3
    expect(result, DateFormat.yMMMd().format(DateTime.now()));
  });
}
