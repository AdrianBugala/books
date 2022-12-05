import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books/app/core/enums.dart';
import 'package:my_books/features/home/cubit/home_cubit.dart';
import 'package:my_books/repositories/book_repository.dart';
import 'package:my_books/widgets/book_thumbnail.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(BookRepository())..start(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ?? 'Unknown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          final bookModel = state.bookModel;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Books'),
            ),
            body: Center(
              child: ListView(
                children: [
                  if (bookModel != null)
                    BookThumbnail(
                      bookModel: bookModel,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
