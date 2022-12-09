part of 'home_cubit.dart';

class HomeState {
  HomeState({
    this.status = Status.initial,
    this.bookModel = const [],
    this.errorMessage,
    this.removnigErrorOccured = false,
  });

  final Status status;
  final List<BookModel> bookModel;
  final String? errorMessage;
  final bool removnigErrorOccured;
}
