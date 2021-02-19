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
      margin: const EdgeInsets.only(top: 120, left: 68, right: 68),
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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SelectableText(
                          widget.author.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: txtColor,
                          ),
                        ),
                        SelectableText(
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
