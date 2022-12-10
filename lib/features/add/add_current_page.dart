import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books/data/remote_data_sources/book_remote_data_source.dart';
import 'package:my_books/domain/models/book_model.dart';
import 'package:my_books/domain/repositories/book_repository.dart';
import 'package:my_books/features/add/cubit/add_cubit.dart';

class AddCurrentPage extends StatefulWidget {
  const AddCurrentPage({required this.bookModel, super.key});
  final BookModel bookModel;
  @override
  State<AddCurrentPage> createState() => _AddCurrentPageState();
}

class _AddCurrentPageState extends State<AddCurrentPage> {
  @override
  Widget build(BuildContext context) {
    double? currentPage = 0;

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
                      context.read<AddCubit>().updateCurrentPage(
                          id: widget.bookModel.id, currentPage: currentPage!);
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
                        currentPage = double.tryParse(newValue);
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text('Pages:'),
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
