import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books/app/core/enums.dart';
import 'package:my_books/data/remote_data_sources/book_remote_data_source.dart';
import 'package:my_books/features/add/add_page.dart';
import 'package:my_books/features/home/cubit/home_cubit.dart';
import 'package:my_books/domain/repositories/book_repository.dart';
import 'package:my_books/features/home/pages/book_thumbnail.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(BookRepository(BookRemoteDataSource()))..start(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.removnigErrorOccured) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Unable to remove the item'),
                backgroundColor: Colors.red,
              ),
            );
          }
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ?? 'Unknown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Books'),
            ),
            body: Center(
              child: ListView(
                children: [
                  for (final bookModel in state.bookModel)
                    Dismissible(
                      direction: DismissDirection.endToStart,
                      key: ValueKey(bookModel.id),
                      onDismissed: (direction) {
                        context.read<HomeCubit>().remove(id: bookModel.id);
                      },
                      background: const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.red,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 32.0),
                              child: Icon(
                                Icons.delete,
                              ),
                            ),
                          ),
                        ),
                      ),
                      child: BookThumbnail(
                        bookModel: bookModel,
                      ),
                    ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const AddPage(),
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
