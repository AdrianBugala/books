import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books/data/remote_data_sources/book_remote_data_source.dart';
import 'package:my_books/domain/models/book_model.dart';
import 'package:my_books/domain/repositories/book_repository.dart';
import 'package:my_books/features/remove/cubit/remove_cubit.dart';

class RemoveDialog extends StatelessWidget {
  const RemoveDialog({
    required this.bookModel,
    Key? key,
  }) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RemoveCubit(BookRepository(BookRemoteDataSource())),
      child: BlocConsumer<RemoveCubit, RemoveState>(
        listener: (context, state) {
          if (state.remove) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('You removed the ${bookModel.title}'),
                backgroundColor: Colors.red,
              ),
            );
          }
          if (state.removnigErrorOccured) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Unable to remove the item'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return AlertDialog(
            title: const Text('Are you sure to delete this book?'),
            actions: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  const Expanded(child: SizedBox()),
                  ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.red)),
                    onPressed: () {
                      context.read<RemoveCubit>().remove(id: bookModel.id);
                    },
                    child: const Text('Delete'),
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
