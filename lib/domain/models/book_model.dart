import 'package:intl/intl.dart';

class BookModel {
  BookModel({
    this.id = '',
    required this.title,
    required this.author,
    required this.imageURL,
    required this.description,
    required this.comment,
    required this.pages,
    required this.currentPage,
    required this.dateAdded,
  });

  final String id;
  final String title;
  final String author;
  final String? imageURL;
  final String? description;
  final String? comment;
  final double? pages;
  final double? currentPage;
  final DateTime dateAdded;

  String get dateAddedFormatted {
    return DateFormat.yMMMd().format(dateAdded);
  }
}
