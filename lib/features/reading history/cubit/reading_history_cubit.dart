import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_books/app/core/enums.dart';
import 'package:my_books/domain/models/reading_history_model.dart';
import 'package:my_books/domain/repositories/book_repository.dart';

part 'reading_history_state.dart';
part 'reading_history_cubit.freezed.dart';

@injectable
class ReadingHistoryCubit extends Cubit<ReadingHistoryState> {
  ReadingHistoryCubit(this._bookRepository)
      : super(const ReadingHistoryState());

  final BookRepository _bookRepository;
  StreamSubscription? _streamSubscription;

  Future<void> start({required String id}) async {
    emit(const ReadingHistoryState(status: Status.loading));
    _streamSubscription = _bookRepository.getReadingHistory(id: id).listen(
      (books) {
        emit(
          ReadingHistoryState(status: Status.success, historyModel: books),
        );
      },
    )..onError((error) {
        emit(
          ReadingHistoryState(
              status: Status.error, errorMessage: error.toString()),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
