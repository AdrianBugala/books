import 'package:flutter/material.dart';

class ReadingHistory extends StatelessWidget {
  const ReadingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double bookInfoPadding = 10;
    double bookCardPadding = 5;

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
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return HistoryDetails(
                            index: index,
                          );
                        },
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HistoryDetails extends StatelessWidget {
  const HistoryDetails({Key? key, required this.index}) : super(key: key);
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
                children: const [
                  Text(
                    'Date:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '2023.01.08',
                    style: TextStyle(
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
                children: const [
                  Text(
                    'Pages read:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '50',
                    style: TextStyle(
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
                    children: const [
                      Text(
                        '10',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Icon(Icons.arrow_right_alt),
                      Text(
                        '60',
                        style: TextStyle(
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
