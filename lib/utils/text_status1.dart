import 'package:battery_saver_app/utils/Text1.dart';
import 'package:battery_saver_app/utils/constants.dart';
import 'package:flutter/material.dart';

class textStatus1 extends StatelessWidget {
  final Color backgroundColor;
  final String textString;
  const textStatus1(
      {Key? key, required this.backgroundColor, required this.textString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 30,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text1(
          textString: textString,
          textColor: white,
          textFont: 20,
        ),
      ),
    );
  }
}
