import 'package:flutter/material.dart';
import 'package:my_books/domain/models/book_model.dart';
import 'package:my_books/features/add/pages/add_current_page.dart';
import 'package:my_books/features/edit/pages/edit_page.dart';
import 'package:my_books/features/remove/pages/remove_page.dart';

class BookPopupMenuButton extends StatelessWidget {
  const BookPopupMenuButton({
    Key? key,
    required this.bookModel,
  }) : super(key: key);

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 1,
          child: Text('Add current page'),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text('Edit'),
        ),
        const PopupMenuItem(
          value: 3,
          child: Text('Delete'),
        ),
      ],
      onSelected: (value) {
        if (value == 1) {
          showDialog(
              context: context,
              builder: (context) => AddCurrentPage(
                    bookModel: bookModel,
                  ));
        }
        if (value == 2) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => EditPage(
                    bookModel: bookModel,
                  )));
        }
        if (value == 3) {
          showDialog(
              context: context,
              builder: (context) => RemoveDialog(
                    bookModel: bookModel,
                  ));
        }
      },
    );
  }
}
