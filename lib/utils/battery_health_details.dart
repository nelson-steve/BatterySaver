import 'package:battery_saver_app/utils/Text1.dart';
import 'package:flutter/material.dart';

class BatteryHealthDetails extends StatelessWidget {
  final String text1, text2;
  final Color textColor;
  final double textFontSize;

  const BatteryHealthDetails({
    Key? key,
    required this.text1,
    required this.text2,
    required this.textColor,
    required this.textFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text1(
            textString: text1,
            textColor: textColor,
            textFont: textFontSize,
          ),
          Text1(
            textString: text2,
            textColor: textColor,
            textFont: textFontSize,
          ),
        ],
      ),
    );
  }
}
