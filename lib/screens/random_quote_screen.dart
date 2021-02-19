import 'package:flutter/material.dart';
import 'package:random_quote_generator/utils/helpers.dart';
import 'package:random_quote_generator/widgets/author_text.dart';
import 'package:random_quote_generator/widgets/quote_text.dart';
import 'package:random_quote_generator/widgets/randomize_button.dart';

class RandomQuoteScreen extends StatelessWidget {
  const RandomQuoteScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Quote quote = Quote(
      text:
          "\"The first rule of any technology used in a business is that automation applied to an efficient operation will magnify the efficiency. The second is that automation applied to an inefficient operation will magnify the inefficiency.\"",
      author: Author(name: "Bill Gates", note: "business"),
    );

    return Material(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RandomizeButton(
                onTap: () {},
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 100),
                padding: const EdgeInsets.only(top: 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuoteText(
                      quote: quote,
                    ),
                    AuthorText(
                      author: quote.author,
                      onTap: () => print("author"),
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
