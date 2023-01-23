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

  Color get backgroundColor {
    if (bookModel.pages! < bookModel.currentPage!) {
      return Colors.red.shade300;
    }
    return Colors.blue.shade200;
  }

  Color get progressColor {
    if ((bookModel.pages! == bookModel.currentPage!) && bookModel.pages! > 0) {
      return Colors.green;
    }
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      width: bookInfoWidth,
      center: Text(text),
      percent: checkPercentValue,
      lineHeight: coverHight * 1 / 11,
      backgroundColor: backgroundColor,
      progressColor: progressColor,
      padding: const EdgeInsets.symmetric(horizontal: 0),
    );
  }
}
