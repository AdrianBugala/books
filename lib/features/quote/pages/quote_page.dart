import 'package:flutter/material.dart';
import 'package:my_books/domain/models/quote_model.dart';

class QuotePage extends StatelessWidget {
  const QuotePage({
    required this.quoteModel,
    Key? key,
  }) : super(key: key);
  final QuoteModel quoteModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '"${quoteModel.quote}"',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  quoteModel.author,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
