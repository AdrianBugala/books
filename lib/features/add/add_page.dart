import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books/data/remote_data_sources/book_remote_data_source.dart';
import 'package:my_books/domain/models/book_model.dart';
import 'package:my_books/domain/repositories/book_repository.dart';
import 'package:my_books/features/add/cubit/add_cubit.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    String? title;
    String? author;
    String? imageURL;
    String? description;
    String? comment;
    double? pages;
    double? currentPage;
    String defaultCover =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaBezZp8vcLn-VK1wZ7zo4PQr_8lAGVjbcEV7BSQ2B8Ulstou6Aw3sRREv3nLJJUbClVc&usqp=CAU';

    return BlocProvider(
      create: (context) => AddCubit(BookRepository(BookRemoteDataSource())),
      child: BlocConsumer<AddCubit, AddState>(
        listener: (context, state) {
          if (state.saved == true) {
            return Navigator.of(context).pop();
          } else if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Text('An error occured: ${state.errorMessage}')));
          }
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Add Book'),
                actions: [
                  IconButton(
                    onPressed: () {
                      context.read<AddCubit>().addBook(
                          book: BookModel(
                              title: title ?? 'Title',
                              author: author ?? '',
                              imageURL: imageURL ?? defaultCover,
                              description: description ?? '',
                              comment: comment ?? '',
                              pages: pages ?? 0,
                              currentPage: currentPage ?? 0));
                    },
                    icon: const Icon(Icons.check),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView(
                  children: [
                    TextField(
                      onChanged: (newValue) {
                        title = newValue;
                      },
                      autofocus: true,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: const InputDecoration(
                        label: Text('Title*:'),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      onChanged: (newValue) {
                        author = newValue;
                      },
                      textCapitalization: TextCapitalization.sentences,
                      decoration: const InputDecoration(
                        label: Text('Author(s):'),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      onChanged: (newValue) {
                        imageURL = newValue;
                      },
                      keyboardType: TextInputType.url,
                      decoration: const InputDecoration(
                        label: Text('ImageUrl:'),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      onChanged: (newValue) {
                        pages = double.tryParse(newValue);
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text('Pages:'),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      onChanged: (newValue) {
                        description = newValue;
                      },
                      textCapitalization: TextCapitalization.sentences,
                      decoration: const InputDecoration(
                        label: Text('Description:'),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      onChanged: (newValue) {
                        comment = newValue;
                      },
                      textCapitalization: TextCapitalization.sentences,
                      decoration: const InputDecoration(
                        label: Text('Comment:'),
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
