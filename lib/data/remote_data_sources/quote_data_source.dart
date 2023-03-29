import 'package:dio/dio.dart';
import 'package:my_books/domain/models/quote_model.dart';
import 'package:retrofit/retrofit.dart';

part 'quote_data_source.g.dart';

@RestApi(
    baseUrl: "https://my-json-server.typicode.com/AdrianBugala/quotesjson/")
abstract class QuoteRemoteRetrofitDataSource {
  factory QuoteRemoteRetrofitDataSource(Dio dio, {String baseUrl}) =
      _QuoteRemoteRetrofitDataSource;

  @GET("/quotes")
  Future<List<QuoteModel>> getQuotes();
}
