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
      shadowColor: Theme.of(context).colorScheme.shadow,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(7))),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 1,
          child: _TextContainer(
            text: 'Add current page',
            radius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
          ),
        ),
        const PopupMenuItem(
          value: 2,
          child: _TextContainer(
            text: 'Edit',
            radius: BorderRadius.zero,
          ),
        ),
        const PopupMenuItem(
          value: 3,
          child: _TextContainer(
            text: 'Delete',
            radius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5)),
          ),
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
      color: Theme.of(context).colorScheme.primary,
    );
  }
}

class _TextContainer extends StatelessWidget {
  const _TextContainer({
    required this.text,
    required this.radius,
  });
  final String text;
  final BorderRadius radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: radius),
      width: double.infinity,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondaryContainer),
      ),
    );
  }
}
