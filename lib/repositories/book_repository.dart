import 'dart:async';

import 'package:my_books/data/remote_data_sources/book_remote_data_source.dart';
import 'package:my_books/domain/models/book_model.dart';

class BookRepository {
  BookRepository(this._bookRemoteDataSource);

  final BookRemoteDataSource _bookRemoteDataSource;

  Stream<List<BookModel>> getBookDocuments() {
    return _bookRemoteDataSource.getBookData().map((querySnapshot) {
      return querySnapshot.docs
          .map(
            (book) => BookModel(
              id: book.id,
              title: book['title'],
              author: book['author'],
              imageURL: book['image_url'],
              description: book['description'],
              comment: book['comment'],
              pages: (book['pages'] + 0.0) as double,
              currentPage: (book['current_page'] + 0.0) as double,
            ),
          )
          .toList();
    });
  }
}
