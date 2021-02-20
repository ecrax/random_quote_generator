import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:random_quote_generator/utils/helpers.dart';
import 'package:random_quote_generator/widgets/footer.dart';
import 'package:random_quote_generator/widgets/quote_text.dart';
import 'package:random_quote_generator/widgets/close_button.dart' as cb;

class AuthorQuotesScreen extends StatefulWidget {
  const AuthorQuotesScreen({Key key, this.authorName}) : super(key: key);

  final String authorName;

  @override
  _AuthorQuotesScreenState createState() => _AuthorQuotesScreenState();
}

class _AuthorQuotesScreenState extends State<AuthorQuotesScreen> {
  Future<List<dynamic>> futureQuoteList;

  Future<List<dynamic>> fetchQuoteByAuthor(String author) async {
    final response = await http
        .get("https://quote-garden.herokuapp.com/api/v3/quotes?author=$author");

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var quoteList = List();

      for (var item in json["data"]) {
        quoteList.add(Quote(text: item["quoteText"]));
      }
      return quoteList;
    } else {
      throw Exception("Failed to load quote");
    }
  }

  @override
  void initState() {
    super.initState();
    futureQuoteList = fetchQuoteByAuthor(widget.authorName);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cb.CloseButton(
                onTap: () => Navigator.pop(context),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: SelectableText(
                  widget.authorName,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
              Divider(
                height: MediaQuery.of(context).size.height * 0.13,
              ),
              FutureBuilder(
                future: futureQuoteList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1),
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => Divider(
                          height: MediaQuery.of(context).size.height * 0.13,
                        ),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return QuoteText(quote: snapshot.data[index]);
                        },
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
              Divider(
                height: MediaQuery.of(context).size.height * 0.13,
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.02),
                child: Footer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
