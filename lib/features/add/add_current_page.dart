import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books/data/remote_data_sources/book_remote_data_source.dart';
import 'package:my_books/domain/models/book_model.dart';
import 'package:my_books/domain/repositories/book_repository.dart';
import 'package:my_books/features/add/cubit/add_cubit.dart';

class AddCurrentPage extends StatelessWidget {
  const AddCurrentPage({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    double? currentPage;
    return BlocProvider(
      create: (context) => AddCubit(BookRepository(BookRemoteDataSource())),
      child: BlocConsumer<AddCubit, AddState>(
        listener: (context, state) {
          if (state.saved) {
            Navigator.of(context).pop();
          } else if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Text('An error occured: ${state.errorMessage}')));
          }
        },
        builder: (context, state) {
          return AlertDialog(
            title: const Text('Current page:'),
            content: TextField(
              controller: TextEditingController(
                  text: bookModel.currentPage!.toStringAsFixed(0)),
              onChanged: (newValue) {
                currentPage = double.tryParse(newValue);
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Page:'),
            ),
            actions: [
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel')),
                  const Expanded(child: SizedBox()),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AddCubit>().updateCurrentPage(
                          id: bookModel.id,
                          currentPage: currentPage ?? bookModel.currentPage!);
                    },
                    child: const Text('Update page'),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
