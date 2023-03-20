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
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Date:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer),
                  ),
                  Text(
                    historyModel.dateAddedFormatted,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
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
                  Text(
                    'Pages read:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer),
                  ),
                  Text(
                    historyModel.pagesRead.toStringAsFixed(0),
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
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
                  Text(
                    'Current page:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer),
                  ),
                  Row(
                    children: [
                      Text(
                        historyModel.lastPage.toStringAsFixed(0),
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                      Text(
                        historyModel.currentPage.toStringAsFixed(0),
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
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
