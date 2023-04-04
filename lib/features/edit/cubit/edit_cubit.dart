import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_books/domain/models/book_model.dart';
import 'package:my_books/domain/repositories/book_repository.dart';

part 'edit_state.dart';
part 'edit_cubit.freezed.dart';

@injectable
class EditCubit extends Cubit<EditState> {
  EditCubit(this._bookRepository) : super(const EditState());

  final BookRepository _bookRepository;

  Future<void> updateBookData(BookModel book) async {
    try {
      await _bookRepository.updateBookData(book: book);
      emit(const EditState(saved: true));
    } catch (error) {
      emit(EditState(errorMessage: error.toString()));
    }
  }
}
