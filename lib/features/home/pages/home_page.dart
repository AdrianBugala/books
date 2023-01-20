import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books/app/core/enums.dart';
import 'package:my_books/data/remote_data_sources/book_remote_data_source.dart';
import 'package:my_books/features/add/add_page.dart';
import 'package:my_books/features/auth/pages/user_profile.dart';
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
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const UserProfile()));
                    },
                    icon: const Icon(Icons.person))
              ],
            ),
            body: ListView(
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text('${state.bookModel.length} books in this folder'),
                )),
                for (final bookModel in state.bookModel)
                  BookThumbnail(
                    bookModel: bookModel,
                  ),
              ],
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
