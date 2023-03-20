import 'package:flutter/material.dart';
import 'package:my_books/domain/models/book_model.dart';
import 'package:my_books/features/details/pages/details_page.dart';
import 'package:my_books/widgets/book_linear_percent_indicator.dart';
import 'package:my_books/widgets/book_popup_menu_button.dart';

class BookThumbnail extends StatelessWidget {
  const BookThumbnail({
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

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DetailsPage(bookModel: bookModel),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(
            top: 10, left: bookCardPadding, right: bookCardPadding),
        child: SizedBox(
          height: coverHight,
          width: deviceWidth - bookCardPadding * 2,
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
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                //! Book cover
                Container(
                  height: coverHight,
                  width: coverWidth,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    image: DecorationImage(
                      image: NetworkImage(bookModel.imageURL ?? ''),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                //! Book info
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
                            SizedBox(
                              width: bookInfoWidth - bookInfoWidth * 1 / 5,
                              child:

                                  //! Title and author
                                  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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

                            //! Popup Button
                            BookPopupMenuButton(bookModel: bookModel),
                          ],
                        ),
                      ),
                      const Expanded(child: SizedBox()),

                      //! Date info
                      Row(
                        children: [
                          Text(
                            'Date added: ',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                            ),
                          ),
                          Text(
                            bookModel.dateAddedFormatted,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                            ),
                          ),
                        ],
                      ),

                      //! Progress Indicator
                      SizedBox(
                        width: bookInfoWidth,
                        child: Row(
                          children: [
                            Text(
                              'Progress:',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            Text(
                              'Pages: ',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                              ),
                            ),
                            Text(
                              bookModel.pages!.toStringAsFixed(0),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                              ),
                            ),
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
                            bookModel: bookModel),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
