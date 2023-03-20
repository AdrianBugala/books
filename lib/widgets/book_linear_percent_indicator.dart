import 'package:flutter/material.dart';
import 'package:my_books/domain/models/book_model.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BookLinearPercentIndicator extends StatelessWidget {
  const BookLinearPercentIndicator({
    Key? key,
    required this.bookInfoWidth,
    required this.coverHight,
    required this.bookModel,
  }) : super(key: key);

  final double bookInfoWidth;
  final double coverHight;
  final BookModel bookModel;

  double get checkPercentValue {
    if (bookModel.pages! < bookModel.currentPage!) {
      return 0;
    } else if (bookModel.pages == 0) {
      return 0;
    }
    return (bookModel.currentPage ?? 0) / (bookModel.pages ?? 0);
  }

  String get text {
    if (bookModel.pages! < bookModel.currentPage!) {
      return 'Fix your pages';
    } else if ((bookModel.pages! == bookModel.currentPage!) &&
        bookModel.pages! > 0) {
      return 'Completed!';
    }
    return '${bookModel.currentPage!.toStringAsFixed(0)} / ${bookModel.pages!.toStringAsFixed(0)}';
  }

  Color backgroundColor(Color error, Color background) {
    if (bookModel.pages! < bookModel.currentPage!) {
      return error;
    }
    return background;
  }

  Color progressColor(Color completed, Color inProgress) {
    if ((bookModel.pages! == bookModel.currentPage!) && bookModel.pages! > 0) {
      return completed;
    }
    return inProgress;
  }

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      width: bookInfoWidth,
      center: Text(
        text,
        style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            fontWeight: FontWeight.bold),
      ),
      percent: checkPercentValue,
      lineHeight: coverHight * 1 / 11,
      backgroundColor: backgroundColor(
          Theme.of(context).colorScheme.error,
          // Theme.of(context).colorScheme.surface,
          Colors.blue.shade300),
      progressColor: progressColor(Colors.green, Colors.blue
          // Theme.of(context).colorScheme.primary
          ),
      padding: const EdgeInsets.symmetric(horizontal: 0),
    );
  }
}
