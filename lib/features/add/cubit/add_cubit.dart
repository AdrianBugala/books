import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_books/domain/models/book_model.dart';
import 'package:my_books/domain/models/reading_history_model.dart';
import 'package:my_books/domain/repositories/book_repository.dart';

part 'add_state.dart';
part 'add_cubit.freezed.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit(this._bookRepository) : super(const AddState());

  final BookRepository _bookRepository;

  Future<void> addBook({required BookModel book}) async {
    try {
      await _bookRepository.add(book: book);
      emit(const AddState(saved: true));
    } catch (error) {
      emit(AddState(errorMessage: error.toString()));
    }
  }

  Future<void> updateCurrentPageAndAddFileToHistory(
      {required String bookId,
      required double currentPage,
      required ReadingHistoryModel history}) async {
    try {
      await _bookRepository.updateCurrentPage(
          id: bookId, currentPage: currentPage);
      await _bookRepository.addFileToHistory(bookId: bookId, history: history);
      emit(const AddState(saved: true));
    } catch (error) {
      emit(AddState(errorMessage: error.toString()));
    }
  }
}
