part of 'home_cubit.dart';

class HomeState {
  HomeState({
    this.status = Status.initial,
    this.bookModel,
    this.errorMessage,
  });

  final Status status;
  final BookModel? bookModel;
  final String? errorMessage;
}
