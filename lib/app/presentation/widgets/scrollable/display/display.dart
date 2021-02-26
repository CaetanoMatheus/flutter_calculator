import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String topText;
  final String mainText;
  final double height;
  final Alignment alignment;

  Display({
    Key key,
    this.topText,
    this.mainText,
    this.height = 1,
    this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      height: MediaQuery.of(context).size.height * .1 * height,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                topText,
                style: TextStyle(fontSize: 38),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(mainText, style: TextStyle(fontSize: 48)),
            ),
          ],
        ),
      ),
    );
  }
}
