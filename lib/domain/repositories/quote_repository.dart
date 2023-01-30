import 'dart:math';

import 'package:my_books/data/remote_data_sources/quote_data_source.dart';
import 'package:my_books/domain/models/quote_model.dart';

class QuoteRepository {
  QuoteRepository(this._quoteDataSource);

  final QuoteDataSource _quoteDataSource;

  Future<QuoteModel> getQuoteData() async {
    final json = await _quoteDataSource.getQuotes();
    final list = json.map((item) => QuoteModel.fromJson(item)).toList();
    final random = Random();
    final randomQuote = list[random.nextInt(list.length)];
    return randomQuote;
  }
}
