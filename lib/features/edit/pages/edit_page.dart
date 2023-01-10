import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_books/data/remote_data_sources/book_remote_data_source.dart';
import 'package:my_books/domain/models/book_model.dart';
import 'package:my_books/domain/repositories/book_repository.dart';
import 'package:my_books/features/edit/cubit/edit_cubit.dart';

class EditPage extends StatefulWidget {
  const EditPage({required this.bookModel, super.key});
  final BookModel bookModel;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  String? title;
  String? author;
  String? imageURL;
  String? description;
  String? comment;
  double? pages;
  double? currentPage;
  DateTime? dateAdded;

  String get selectedDateFormatted {
    if (dateAdded == null) {
      return DateFormat.yMMMEd().format(widget.bookModel.dateAdded);
    }
    return DateFormat.yMMMEd().format(dateAdded!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditCubit(BookRepository(BookRemoteDataSource())),
      child: BlocConsumer<EditCubit, EditState>(
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
                title: const Text('Edit Book'),
                actions: [
                  IconButton(
                    onPressed: () {
                      context.read<EditCubit>().updateBookData(
                            BookModel(
                              id: widget.bookModel.id,
                              title: title ?? widget.bookModel.title,
                              author: author ?? widget.bookModel.author,
                              imageURL: imageURL ?? widget.bookModel.imageURL,
                              description:
                                  description ?? widget.bookModel.description,
                              comment: comment ?? widget.bookModel.comment,
                              pages: pages ?? widget.bookModel.pages,
                              currentPage:
                                  currentPage ?? widget.bookModel.currentPage,
                              dateAdded:
                                  dateAdded ?? widget.bookModel.dateAdded,
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
                    TextField(
                      controller:
                          TextEditingController(text: widget.bookModel.title),
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
                      controller:
                          TextEditingController(text: widget.bookModel.author),
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
                      controller: TextEditingController(
                          text: widget.bookModel.imageURL),
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
                      controller: TextEditingController(
                          text: widget.bookModel.description),
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
                      controller:
                          TextEditingController(text: widget.bookModel.comment),
                      onChanged: (newValue) {
                        comment = newValue;
                      },
                      textCapitalization: TextCapitalization.sentences,
                      decoration: const InputDecoration(
                        label: Text('Comment:'),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 7.5),
                            child: TextField(
                              controller: TextEditingController(
                                  text: widget.bookModel.currentPage!
                                      .toStringAsFixed(0)),
                              onChanged: (newValue) {
                                currentPage = double.tryParse(newValue);
                              },
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                label: Text('Current page:'),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 7.5),
                            child: TextField(
                              controller: TextEditingController(
                                  text: widget.bookModel.pages!
                                      .toStringAsFixed(0)),
                              onChanged: (newValue) {
                                pages = double.tryParse(newValue);
                              },
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                label: Text('All pages:'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Date added:',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              final selectedDate = await showDatePicker(
                                context: context,
                                initialDate: widget.bookModel.dateAdded,
                                firstDate: DateTime.now()
                                    .subtract(const Duration(days: 365)),
                                lastDate: DateTime.now(),
                              );

                              setState(() {
                                dateAdded = selectedDate;
                              });
                            },
                            child: Text(selectedDateFormatted)

                            // Text(dateAdded == null
                            //     ? DateFormat.yMMMMd().format(dateAdded!)
                            //     : DateFormat.yMMMMd()
                            //         .format(widget.bookModel.dateAdded)),
                            ),
                      ],
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
