import 'package:battery_saver_app/utils/Text1.dart';
import 'package:battery_saver_app/utils/constants.dart';
import 'package:flutter/material.dart';

class SummaryNotification extends StatelessWidget {
  final String notificationString;
  const SummaryNotification({Key? key, required this.notificationString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 25,
      color: grey,
      child: Center(
        child: Text1(
          textString: notificationString,
          textColor: Colors.black87,
          textFont: 15,
        ),
      ),
    );
  }
}
