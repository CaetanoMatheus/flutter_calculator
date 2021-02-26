import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String topText;
  final String mainText;

  Display({Key key, this.topText, this.mainText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              topText,
              style: TextStyle(fontSize: 38),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(mainText, style: TextStyle(fontSize: 48)),
          ),
        ],
      ),
    );
  }
}
