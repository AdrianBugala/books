import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books/app/core/enums.dart';
import 'package:my_books/data/remote_data_sources/book_remote_data_source.dart';
import 'package:my_books/domain/repositories/book_repository.dart';
import 'package:my_books/features/reading%20history/cubit/reading_history_cubit.dart';
import 'package:my_books/features/reading%20history/pages/history_details.dart';

class ReadingHistory extends StatelessWidget {
  const ReadingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double bookInfoPadding = 10;
    double bookCardPadding = 5;

    return BlocProvider(
      create: (context) =>
          ReadingHistoryCubit(BookRepository(BookRemoteDataSource()))..start(),
      child: BlocConsumer<ReadingHistoryCubit, ReadingHistoryState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ?? 'Unknown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('History')),
            body: Padding(
              padding: EdgeInsets.all(bookCardPadding),
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Container(
                        width: deviceWidth,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(15, 0, 0, 0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(3, 5),
                            ),
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(bookInfoPadding),
                          child: ListView.builder(
                            itemCount: state.historyModel.length,
                            itemBuilder: (context, index) {
                              final historyModel = state.historyModel;
                              return HistoryDetails(
                                historyModel: historyModel[index],
                                index: index,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
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
