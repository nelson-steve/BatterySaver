import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final String textString;
  String subString;
  NotificationTile({Key? key, required this.textString, this.subString = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        textString,
      ),
      subtitle: Text(subString),
      trailing: Icon(Icons.notifications_on_outlined),
    );
  }
}
