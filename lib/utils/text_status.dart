import 'package:battery_saver_app/utils/Text1.dart';
import 'package:battery_saver_app/utils/constants.dart';
import 'package:flutter/material.dart';

class textStatus extends StatelessWidget {
  final Color backgroundColor;
  final String textString;
  final double fontSize;
  final double border;
  textStatus(
      {Key? key,
      this.fontSize = 20,
      required this.backgroundColor,
      required this.textString,
      this.border = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 30,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text1(
          textString: textString,
          textColor: white,
          textFont: fontSize,
        ),
      ),
    );
  }
}
