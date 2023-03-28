import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_books/app/core/enums.dart';
import 'package:my_books/domain/models/book_model.dart';
import 'package:my_books/domain/repositories/book_repository.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._bookRepository) : super(const HomeState());

  final BookRepository _bookRepository;
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(const HomeState(status: Status.loading));

    _streamSubscription = _bookRepository.getBookDocuments().listen(
      (books) {
        emit(
          HomeState(status: Status.success, bookModel: books),
        );
      },
    )..onError((error) {
        emit(
          HomeState(status: Status.error, errorMessage: error.toString()),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
