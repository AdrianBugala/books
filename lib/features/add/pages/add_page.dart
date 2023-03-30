import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_books/app/injection_container.dart';
import 'package:my_books/domain/models/book_model.dart';
import 'package:my_books/features/add/cubit/add_cubit.dart';
import 'package:my_books/widgets/add_text_field.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String? title;
  String? author;
  String? imageURL;
  String? description;
  String? comment;
  double? pages;
  double? currentPage;
  DateTime? dateAdded;
  String defaultCover =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaBezZp8vcLn-VK1wZ7zo4PQr_8lAGVjbcEV7BSQ2B8Ulstou6Aw3sRREv3nLJJUbClVc&usqp=CAU';

  String get selectedDateFormatted {
    if (dateAdded != null) {
      return DateFormat.yMMMMd().format(dateAdded!);
    }
    return 'Select date';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddCubit>(),
      child: BlocConsumer<AddCubit, AddState>(
        listener: (context, state) {
          if (state.saved == true) {
            return Navigator.of(context).pop();
          } else if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Theme.of(context).colorScheme.error,
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
                            currentPage: currentPage ?? 0,
                            dateAdded: dateAdded ?? DateTime.now(),
                          ),
                        );
                  },
                  icon: const Icon(Icons.check),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  AddTextField(
                      onChanged: (newValue) {
                        title = newValue;
                      },
                      text: 'Title*:',
                      autofocus: true),
                  AddTextField(
                      onChanged: (newValue) {
                        author = newValue;
                      },
                      text: 'Author(s):',
                      textCapitalization: TextCapitalization.words),
                  AddTextField(
                      onChanged: (newValue) {
                        imageURL = newValue;
                      },
                      text: 'ImageUrl:',
                      keyboardType: TextInputType.url),
                  AddTextField(
                      onChanged: (newValue) {
                        pages = double.tryParse(newValue);
                      },
                      text: 'Pages:',
                      keyboardType: TextInputType.number),
                  AddTextField(
                      onChanged: (newValue) {
                        description = newValue;
                      },
                      text: 'Description:'),
                  AddTextField(
                      onChanged: (newValue) {
                        comment = newValue;
                      },
                      text: 'Comment:'),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Date added',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              final selectedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now()
                                    .subtract(const Duration(days: 365)),
                                lastDate: DateTime.now(),
                              );

                              setState(() {
                                dateAdded = selectedDate;
                              });
                            },
                            child: Text(selectedDateFormatted),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
