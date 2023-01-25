import 'package:my_books/domain/models/quote_model.dart';

class QuoteRepository {
  Future<QuoteModel> getQuoteData() async {
    return QuoteModel(
        author: 'J.R.R Tolkien',
        quote:
            'There is some good in this world, and it\'s worth fighting for.');
  }
}
