import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_books/data/remote_data_sources/book_remote_data_source.dart';
import 'package:my_books/domain/models/book_model.dart';
import 'package:my_books/domain/models/reading_history_model.dart';

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
              dateAdded: (book['date_added'] as Timestamp).toDate(),
            ),
          )
          .toList();
    });
  }

  Stream<List<ReadingHistoryModel>> getReadingHistory({required String id}) {
    return _bookRemoteDataSource.getReadingHistory(id: id).map((querySnapshot) {
      return querySnapshot.docs
          .map(
            (book) => ReadingHistoryModel(
              currentPage: (book['current_page'] + 0.0) as double,
              lastPage: (book['last_page'] + 0.0) as double,
              pagesRead: (book['pages_read'] + 0.0) as double,
              dateAdded: (book['date_added'] as Timestamp).toDate(),
            ),
          )
          .toList();
    });
  }

  Future<void> add({required BookModel book}) {
    return _bookRemoteDataSource.addBook(book: book);
  }

  Future<void> remove({required String id}) {
    return _bookRemoteDataSource.remove(id: id);
  }

  Future<void> updateCurrentPage(
      {required String id, required double currentPage}) {
    return _bookRemoteDataSource.updateCurrentPage(
        id: id, currentPage: currentPage);
  }

  Future<void> updateBookData({required BookModel book}) {
    return _bookRemoteDataSource.updateBookData(book: book);
  }

  Future<void> addFileToHistory(
      {required String bookId, required ReadingHistoryModel history}) {
    return _bookRemoteDataSource.addFileToHistory(
        history: history, bookId: bookId);
  }
}
