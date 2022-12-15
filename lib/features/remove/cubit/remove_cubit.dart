import 'package:bloc/bloc.dart';
import 'package:my_books/domain/repositories/book_repository.dart';

part 'remove_state.dart';

class RemoveCubit extends Cubit<RemoveState> {
  RemoveCubit(this._bookRepository) : super(RemoveState());

  final BookRepository _bookRepository;

  Future<void> remove({required String id}) async {
    try {
      await _bookRepository.remove(id: id);
      emit(RemoveState(remove: true));
    } catch (error) {
      emit(RemoveState(removnigErrorOccured: true));
    }
  }
}
