import 'package:flutter/material.dart';
import 'package:my_books/domain/models/book_model.dart';
import 'package:my_books/features/details/details_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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

    return Padding(
      padding: EdgeInsets.only(
          top: 10, left: bookCardPadding, right: bookCardPadding),
      child: SizedBox(
        height: coverHight,
        width: deviceWidth - bookCardPadding * 2,
        child: Container(
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    bookModel.title,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    bookModel.author,
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        DetailsPage(bookModel: bookModel),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.more_vert))
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    SizedBox(
                      width: bookInfoWidth,
                      child: Row(
                        children: [
                          const Text('Progress'),
                          const Expanded(child: SizedBox()),
                          const Text('Pages:'),
                          Text('${bookModel.pages}'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      child: LinearPercentIndicator(
                        width: bookInfoWidth,
                        percent: (bookModel.currentPage ?? 0) /
                            (bookModel.pages ?? 0),
                        lineHeight: 8,
                        backgroundColor: Colors.blue.shade200,
                        progressColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}