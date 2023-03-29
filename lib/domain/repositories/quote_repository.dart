import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:my_books/data/remote_data_sources/quote_data_source.dart';
import 'package:my_books/domain/models/quote_model.dart';

@injectable
class QuoteRepository {
  QuoteRepository(this._quoteDataSource);

  final QuoteRemoteRetrofitDataSource _quoteDataSource;

  Future<QuoteModel> getQuoteData() async {
    final quotesList = await _quoteDataSource.getQuotes();
    final random = Random();
    final randomQuote = quotesList[random.nextInt(quotesList.length)];
    return randomQuote;
  }
}
