import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_books/domain/models/book_model.dart';

class BookRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getBookData() {
    try {
      final stream = FirebaseFirestore.instance.collection('books').snapshots();

      return stream;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
