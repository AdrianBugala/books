import 'package:bloc/bloc.dart';
import 'package:my_books/domain/models/book_model.dart';
import 'package:my_books/domain/repositories/book_repository.dart';

part 'edit_state.dart';

class EditCubit extends Cubit<EditState> {
  EditCubit(this._bookRepository) : super(EditState());

  final BookRepository _bookRepository;

  Future<void> updateBookData(BookModel book) async {
    try {
      await _bookRepository.updateBookData(book: book);
      emit(EditState(saved: true));
    } catch (error) {
      emit(EditState(errorMessage: error.toString()));
    }
  }
}
