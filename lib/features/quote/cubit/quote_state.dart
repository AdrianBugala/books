part of 'quote_cubit.dart';

class QuoteState {
  QuoteState({
    this.status = Status.initial,
    this.errorMessage,
    this.quoteModel,
  });

  final Status status;
  final String? errorMessage;
  final QuoteModel? quoteModel;
}
