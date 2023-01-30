class QuoteModel {
  QuoteModel({
    required this.author,
    required this.quote,
  });

  final String author;
  final String quote;

  QuoteModel.fromJson(Map<String, dynamic> json)
      : author = json['author'],
        quote = json['quote'];
}
