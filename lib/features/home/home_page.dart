import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
      ),
      body: Center(
        child: ListView(
          children: const [
            BookThumbnail(),
            BookThumbnail(),
            BookThumbnail(),
          ],
        ),
      ),
    );
  }
}

class BookThumbnail extends StatelessWidget {
  const BookThumbnail({
    Key? key,
  }) : super(key: key);

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
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://www.osmpower.pl/userdata/public/gfx/733b8dc58a4df71a4215562c0cd52e94.jpg'),
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
                              children: const [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    'Money',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    'Thony Robbins',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert))
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    SizedBox(
                      width: bookInfoWidth,
                      child: Row(
                        children: const [
                          Text('Progress'),
                          Expanded(child: SizedBox()),
                          Text('Pages:'),
                          Text('555'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      child: LinearPercentIndicator(
                        width: bookInfoWidth,
                        percent: 66 / 100,
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
