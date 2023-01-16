import 'package:flutter/material.dart';
import 'package:my_books/domain/models/reading_history_model.dart';

class BookHistoryDetails extends StatelessWidget {
  const BookHistoryDetails({
    Key? key,
    required this.historyModel,
    required this.index,
  }) : super(key: key);
  final ReadingHistoryModel historyModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Text(
                '${index + 1}.',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Date:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    historyModel.dateAddedFormatted,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Pages read:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    historyModel.pagesRead.toStringAsFixed(0),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Current page:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        historyModel.lastPage.toStringAsFixed(0),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const Icon(Icons.arrow_right_alt),
                      Text(
                        historyModel.currentPage.toStringAsFixed(0),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(
          height: 20,
          endIndent: 10,
          indent: 10,
          thickness: 1,
        ),
      ],
    );
  }
}
