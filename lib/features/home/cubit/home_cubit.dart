import 'package:bloc/bloc.dart';
import 'package:my_books/app/core/enums.dart';
import 'package:my_books/domain/models/book_model.dart';
import 'package:my_books/repositories/book_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._bookRepository) : super(HomeState());

  final BookRepository _bookRepository;

  Future<void> getBookModel() async {
    emit(HomeState(status: Status.loading));

    try {
      final bookModel = await _bookRepository.getBookModel();

      emit(
        HomeState(
          status: Status.success,
          bookModel: bookModel,
        ),
      );
    } catch (error) {
      emit(
        HomeState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
    ;
  }
}
