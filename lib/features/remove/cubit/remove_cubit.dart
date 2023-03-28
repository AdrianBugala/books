import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_books/domain/repositories/book_repository.dart';

part 'remove_state.dart';
part 'remove_cubit.freezed.dart';

class RemoveCubit extends Cubit<RemoveState> {
  RemoveCubit(this._bookRepository) : super(const RemoveState());

  final BookRepository _bookRepository;

  Future<void> remove({required String id}) async {
    try {
      await _bookRepository.remove(id: id);
      emit(const RemoveState(remove: true));
    } catch (error) {
      emit(const RemoveState(removnigErrorOccured: true));
    }
  }
}
