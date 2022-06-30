import 'package:flutter/material.dart';

class Text1 extends StatelessWidget {
  final Color textColor;
  final double textFont;
  final String textString;

  const Text1(
      {required this.textString,
      required this.textColor,
      required this.textFont,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textString,
      style: TextStyle(
        fontFamily: 'Slabo',
        color: textColor,
        fontSize: textFont,
      ),
    );
  }
}
