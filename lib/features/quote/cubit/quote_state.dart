part of 'quote_cubit.dart';

@freezed
class QuoteState with _$QuoteState {
  const factory QuoteState({
    @Default(Status.initial) Status status,
    String? errorMessage,
    QuoteModel? quoteModel,
  }) = _QuoteState;
}
