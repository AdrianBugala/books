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

  Future<void> addBook({required BookModel book}) async {
    await FirebaseFirestore.instance.collection('books').add({
      'title': book.title,
      'author': book.author,
      'image_url': book.imageURL,
      'description': book.description,
      'comment': book.comment,
      'pages': book.pages,
      'current_page': book.currentPage,
    });
  }

  Future<void> remove({required String id}) async {
    FirebaseFirestore.instance.collection('books').doc(id).delete();
  }

  Future<void> updateCurrentPage(
      {required String id, required double currentPage}) async {
    FirebaseFirestore.instance
        .collection('books')
        .doc(id)
        .update({'current_page': currentPage});
  }
}
