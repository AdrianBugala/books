import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_books/domain/models/book_model.dart';

class BookRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getBookData() {
    try {
      final userID = FirebaseAuth.instance.currentUser?.uid;
      if (userID == null) {
        throw Exception('User is not logged in');
      }
      final stream = FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .collection('books')
          .snapshots();

      return stream;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> addBook({required BookModel book}) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('books')
        .add({
      'title': book.title,
      'author': book.author,
      'image_url': book.imageURL,
      'description': book.description,
      'comment': book.comment,
      'pages': book.pages,
      'current_page': book.currentPage,
    });
  }

  Future<void> remove({required String id}) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('books')
        .doc(id)
        .delete();
  }

  Future<void> updateCurrentPage(
      {required String id, required double currentPage}) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('books')
        .doc(id)
        .update({'current_page': currentPage});
  }

  Future<void> updateBookData({required BookModel book}) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('books')
        .doc(book.id)
        .update({
      'title': book.title,
      'author': book.author,
      'image_url': book.imageURL,
      'description': book.description,
      'comment': book.comment,
      'pages': book.pages,
      'current_page': book.currentPage,
    });
  }
}
