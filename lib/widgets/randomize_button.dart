import 'package:flutter/material.dart';

class RandomizeButton extends StatelessWidget {
  const RandomizeButton({
    Key key,
    this.onTap,
  }) : super(key: key);

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 31),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FlatButton.icon(
            onPressed: onTap,
            icon: Text(
              "random",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF4F4F4F),
              ),
            ),
            label: Icon(Icons.refresh),
          )
        ],
      ),
    );
  }
}
