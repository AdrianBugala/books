import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:my_books/domain/models/book_model.dart';

void main() {
  test('should getter dateAddedFormatte return date with nice format', () {
    // 1
    final model = BookModel(
      title: 'title',
      author: 'author',
      imageURL: 'imageURL',
      description: 'description',
      comment: 'comment',
      pages: 100,
      currentPage: 50,
      dateAdded: DateTime.now(),
    );

    // 2
    final result = model.dateAddedFormatted;

    // 3
    expect(result, DateFormat.yMMMd().format(DateTime.now()));
  });
}
