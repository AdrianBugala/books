import 'package:bloc/bloc.dart';
import 'package:my_books/app/core/enums.dart';
import 'package:my_books/domain/models/book_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());
}
