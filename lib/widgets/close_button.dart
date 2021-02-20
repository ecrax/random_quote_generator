import 'package:flutter/material.dart';

class CloseButton extends StatelessWidget {
  const CloseButton({
    Key key,
    this.onTap,
  }) : super(key: key);

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
        vertical: MediaQuery.of(context).size.height * 0.03,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FlatButton.icon(
            onPressed: onTap,
            icon: Text(
              "close",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF4F4F4F),
              ),
            ),
            label: Icon(Icons.close),
          )
        ],
      ),
    );
  }
}
