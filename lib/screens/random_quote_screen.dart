import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:random_quote_generator/screens/author_quotes_screen.dart';
import 'package:random_quote_generator/utils/helpers.dart';
import 'package:random_quote_generator/widgets/author_text.dart';
import 'package:random_quote_generator/widgets/footer.dart';
import 'package:random_quote_generator/widgets/quote_text.dart';
import 'package:random_quote_generator/widgets/randomize_button.dart';

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
    return Material(
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1),
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.19),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AuthorQuotesScreen(
                                    authorName: snapshot.data.author.name,
                                  ),
                                ),
                              );
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
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.13,
                  bottom: MediaQuery.of(context).size.height * 0.02,
                ),
                child: Footer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
