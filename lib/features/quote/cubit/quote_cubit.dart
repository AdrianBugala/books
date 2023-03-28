import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_books/app/core/enums.dart';
import 'package:my_books/domain/models/quote_model.dart';
import 'package:my_books/domain/repositories/quote_repository.dart';

part 'quote_state.dart';
part 'quote_cubit.freezed.dart';

class QuoteCubit extends Cubit<QuoteState> {
  QuoteCubit(this._quoteRepository) : super(const QuoteState());

  final QuoteRepository _quoteRepository;

  Future<void> getQuote() async {
    emit(const QuoteState(status: Status.loading));

    try {
      final quote = await _quoteRepository.getQuoteData();

      emit(QuoteState(quoteModel: quote, status: Status.success));
    } catch (error) {
      emit(
        QuoteState(errorMessage: error.toString()),
      );
    }
  }
}
