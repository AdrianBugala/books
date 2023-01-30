import 'package:dio/dio.dart';

class QuoteDataSource {
  Future<List<Map<String, dynamic>>> getQuotes() async {
    final response = await Dio().get<List<dynamic>>(
        'https://my-json-server.typicode.com/AdrianBugala/quotesjson/quotes');
    final listDynamic = response.data;

    return listDynamic!
        .map((quotes) => quotes as Map<String, dynamic>)
        .toList();
  }
}
