import 'package:flutter/material.dart';


class NumberOfBook extends StatelessWidget {
  const NumberOfBook({
    required this.numberOfBook,
    Key? key,
  }) : super(key: key);
  final int numberOfBook;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text('$numberOfBook books in this folder'),
    ));
  }
}