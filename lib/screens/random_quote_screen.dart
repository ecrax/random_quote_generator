import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:random_quote_generator/utils/helpers.dart';
import 'package:random_quote_generator/widgets/author_text.dart';
import 'package:random_quote_generator/widgets/quote_text.dart';
import 'package:random_quote_generator/widgets/randomize_button.dart';

import 'package:http/http.dart' as http;

class RandomQuoteScreen extends StatefulWidget {
  const RandomQuoteScreen({Key key}) : super(key: key);

  @override
  _RandomQuoteScreenState createState() => _RandomQuoteScreenState();
}

class _RandomQuoteScreenState extends State<RandomQuoteScreen> {
  Future<Quote> futureQuote;

  Future<Quote> fetchRandomQuote() async {
    final response = await http
        .get(Uri.https("quote-garden.herokuapp.com", "api/v3/quotes/random"));

    if (response.statusCode == 200) {
      return Quote.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load quote");
    }
  }

  @override
  void initState() {
    super.initState();
    futureQuote = fetchRandomQuote();
  }

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
                onTap: () {
                  setState(() {
                    futureQuote = fetchRandomQuote();
                  });
                },
              ),
              FutureBuilder(
                future: futureQuote,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 100),
                      padding: const EdgeInsets.only(top: 200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          QuoteText(
                            quote: snapshot.data,
                          ),
                          AuthorText(
                            author: snapshot.data.author,
                            onTap: () {
                              // Redirect to new screen with authors quotes on it
                            },
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
