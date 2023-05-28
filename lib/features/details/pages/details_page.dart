import 'package:flutter/material.dart';
import 'package:my_books/domain/models/book_model.dart';
import 'package:my_books/widgets/book_linear_percent_indicator.dart';
import 'package:my_books/features/reading%20history/pages/book_history.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    required this.bookModel,
    Key? key,
  }) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHight = MediaQuery.of(context).size.height;
    double coverWidth = deviceWidth * 7 / 25; // Old width: 108
    double coverHight = deviceHight * 1 / 5; // Old hight: 160
    double bookInfoPadding = 10;
    double bookCardPadding = 5;
    double bookInfoWidth =
        deviceWidth - coverWidth - bookInfoPadding * 2 - bookCardPadding * 2;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: const Text('My Book')),
      body: Padding(
        padding: EdgeInsets.all(bookCardPadding),
        child: Column(
          children: [
            SizedBox(
              height: coverHight,
              width: double.infinity,
              child: Container(
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
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! Book cover
                    Container(
                      height: coverHight,
                      width: coverWidth,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(bookModel.imageURL ?? ''),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(bookInfoPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: bookInfoWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //! Title and author
                                SizedBox(
                                  width: bookInfoWidth - bookInfoWidth * 1 / 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          bookModel.title,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          bookModel.author,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                //! History button
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => BookHistory(
                                            id: bookModel.id,
                                          ),
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.history,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ))
                              ],
                            ),
                          ),
                          const Expanded(child: SizedBox()),

                          //! Progress indicator
                          SizedBox(
                            width: bookInfoWidth,
                            child: Row(
                              children: [
                                Text(
                                  'Progress:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                Text('Pages: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer,
                                    )),
                                Text(bookModel.pages!.toStringAsFixed(0),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer,
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                              child: BookLinearPercentIndicator(
                            bookInfoWidth: bookInfoWidth,
                            coverHight: coverHight,
                            bookModel: bookModel,
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: Container(
                  width: double.infinity,
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
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(bookInfoPadding),

                    //! Body of book (description, comment, date etc.)
                    child: ListView(
                      children: [
                        Text(
                          'Description:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                        ),
                        Text(
                          bookModel.description ?? '',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                        ),
                        const Divider(
                          height: 20,
                          endIndent: 10,
                          indent: 10,
                          thickness: 1,
                        ),
                        Text(
                          'Comment:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                        ),
                        Text(
                          bookModel.comment ?? '',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                        ),
                        const Divider(
                          height: 20,
                          endIndent: 10,
                          indent: 10,
                          thickness: 1,
                        ),
                        Text(
                          'Date added:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                        ),
                        Text(
                          bookModel.dateAddedFormatted,
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
