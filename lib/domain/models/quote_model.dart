import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_model.g.dart';
part 'quote_model.freezed.dart';

@freezed
class QuoteModel with _$QuoteModel {
  const factory QuoteModel({
    required String author,
    required String quote,
  }) = _QuoteModel;

  factory QuoteModel.fromJson(Map<String, Object?> json) =>
      _$QuoteModelFromJson(json);
}
