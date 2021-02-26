import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String data;
  final double height;
  final Color color;
  final void Function(String) onTap;

  Button(
    this.data, {
    Key key,
    this.height = 1,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: MediaQuery.of(context).size.height * .1 * height,
      child: FlatButton(
        padding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(
            color: Colors.white,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        child: Text(
          data,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        onPressed: () => onTap(data),
      ),
    );
  }
}
