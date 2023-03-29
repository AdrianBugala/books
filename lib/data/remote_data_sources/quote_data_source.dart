import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_books/domain/models/quote_model.dart';
import 'package:retrofit/retrofit.dart';

part 'quote_data_source.g.dart';

@injectable
@RestApi()
abstract class QuoteRemoteRetrofitDataSource {
  @factoryMethod
  factory QuoteRemoteRetrofitDataSource(Dio dio) =
      _QuoteRemoteRetrofitDataSource;

  @GET("/quotes")
  Future<List<QuoteModel>> getQuotes();
}
