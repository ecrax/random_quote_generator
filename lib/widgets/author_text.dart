import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:random_quote_generator/utils/helpers.dart';

class AuthorText extends StatefulWidget {
  const AuthorText({
    Key key,
    this.author,
    this.onTap,
  }) : super(key: key);

  final Author author;
  final Function onTap;

  @override
  _AuthorTextState createState() => _AuthorTextState();
}

class _AuthorTextState extends State<AuthorText> {
  Color bgColor = Colors.white;
  Color txtColor = Color(0xFF4F4F4F);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.11,
        left: MediaQuery.of(context).size.width * 0.07,
        right: MediaQuery.of(context).size.width * 0.07,
      ),
      child: InkWell(
        mouseCursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: MouseRegion(
            onEnter: (event) {
              setState(() {
                bgColor = Color(0xFF333333);
                txtColor = Color(0xFFF2F2F2);
              });
            },
            onExit: (event) {
              setState(() {
                bgColor = Colors.white;
                txtColor = Color(0xFF4F4F4F);
              });
            },
            child: Container(
              color: bgColor,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.03,
                  vertical: MediaQuery.of(context).size.height * 0.04),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          widget.author.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: txtColor,
                          ),
                        ),
                        Text(
                          widget.author.note,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF828282),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
