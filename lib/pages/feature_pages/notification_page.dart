import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/notification_service.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        'Notification',
        style: TextStyle(
          fontFamily: 'Slabo',
          fontSize: 25,
          color: compliment1,
        ),
      ),
        elevation: 0,
        backgroundColor: Colors.indigoAccent,),
      body: Container(color: Colors.white,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("This feature show a notifiaction when the battery is fully charged", style: TextStyle(
              fontFamily: 'Slabo',
              fontSize: 22
          ),
          ),
        ),
        ElevatedButton(onPressed: (() {
          setState(() {
            NotificationService()
                .showNotification(1, "Battery Fully Charged", 'Unplug Charger', 1);
          });
        }),

            child: Text("Demo Notification"))
      ],),
      ),
    );
  }
}
