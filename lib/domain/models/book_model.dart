import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'book_model.freezed.dart';

@freezed
class BookModel with _$BookModel {
  const BookModel._();

  const factory BookModel({
    @Default('') String id,
    required String title,
    required String author,
    required String? imageURL,
    required String? description,
    required String? comment,
    required double? pages,
    required double? currentPage,
    required DateTime dateAdded,
  }) = _BookModel;

  String get dateAddedFormatted {
    return DateFormat.yMMMd().format(dateAdded);
  }
}
