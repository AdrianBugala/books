import 'package:my_books/domain/models/book_model.dart';

class BookRepository {
  Future<BookModel?> getBookModel() async {
    return BookModel(
      title: 'The power of now',
      author: 'Eckhart Tolle',
      imageURL:
          'https://m.media-amazon.com/images/I/610sFiXXGaL._AC_SY1000_.jpg',
      description: 'description',
      comment: 'comment',
      pages: 222,
      currentPage: 111,
    );
  }
}
