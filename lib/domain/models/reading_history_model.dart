import 'package:intl/intl.dart';

class ReadingHistoryModel {
  ReadingHistoryModel({
    required this.currentPage,
    required this.lastPage,
    required this.pagesRead,
    required this.dateAdded,
  });

  final double currentPage;
  final double lastPage;
  final double pagesRead;
  final DateTime dateAdded;

  String get dateAddedFormatted {
    return DateFormat.yMMMd().format(dateAdded);
  }
}
