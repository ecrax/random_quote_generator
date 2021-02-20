import 'package:flutter/material.dart';
import 'package:random_quote_generator/utils/helpers.dart';

class QuoteText extends StatelessWidget {
  const QuoteText({
    Key key,
    this.quote,
  }) : super(key: key);

  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.06,
      ),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Color(0xFFF7DF94),
            width: 8,
          ),
        ),
      ),
      child: Center(
        child: SelectableText(
          quote.text,
          style: TextStyle(
            fontSize: 36,
          ),
        ),
      ),
    );
  }
}
