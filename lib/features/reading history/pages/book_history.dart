import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books/app/core/enums.dart';
import 'package:my_books/app/injection_container.dart';
import 'package:my_books/features/reading%20history/cubit/reading_history_cubit.dart';
import 'package:my_books/features/reading%20history/pages/book_history_details.dart';

class BookHistory extends StatelessWidget {
  const BookHistory({required this.id, super.key});
  final String id;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double bookInfoPadding = 10;
    double bookCardPadding = 5;

    return BlocProvider(
      create: (context) => getIt<ReadingHistoryCubit>()..start(id: id),
      child: BlocConsumer<ReadingHistoryCubit, ReadingHistoryState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ?? 'Unknown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(title: const Text('History')),
            body: Padding(
              padding: EdgeInsets.all(bookCardPadding),
              child: Container(
                width: deviceWidth,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.shadow,
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(3, 5),
                    ),
                  ],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Builder(
                  builder: (context) {
                    if (state.historyModel.isEmpty) {
                      return Center(
                        child: Text(
                          'You don\'t have a story yet',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer),
                        ),
                      );
                    }
                    return Padding(
                      padding: EdgeInsets.all(bookInfoPadding),
                      child: ListView.builder(
                        itemCount: state.historyModel.length,
                        itemBuilder: (context, index) {
                          final historyModel = state.historyModel;
                          final reverseIndex = state.historyModel.length - index;
                          return BookHistoryDetails(
                            historyModel: historyModel[index],
                            index: reverseIndex,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
