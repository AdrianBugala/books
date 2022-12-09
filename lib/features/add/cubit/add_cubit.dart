import 'package:bloc/bloc.dart';
import 'package:my_books/domain/models/book_model.dart';
import 'package:my_books/domain/repositories/book_repository.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit(this._bookRepository) : super(AddState());

  final BookRepository _bookRepository;

  Future<void> addBook({required BookModel book}) async {
    try {
      await _bookRepository.add(book: book);
      emit(AddState(saved: true));
    } catch (error) {
      emit(AddState(errorMessage: error.toString()));
    }
  }
}
