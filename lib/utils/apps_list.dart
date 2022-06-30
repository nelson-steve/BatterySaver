import 'dart:ui';

import 'package:battery_saver_app/utils/Text1.dart';
import 'package:battery_saver_app/utils/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AppsList extends StatefulWidget {
  const AppsList({Key? key}) : super(key: key);

  @override
  State<AppsList> createState() => _AppsListState();
}

class _AppsListState extends State<AppsList> {
  List<String> apps = ['app1', 'app2', 'app3', 'app4', 'app5', 'app6'];
  List<String> appsDetails = [
    'This is s general comment made for testing purposes',
    'This is s general comment made for testing purposes',
    'This is s general comment made for testing purposes',
    'This is s general comment made for testing purposes',
    'This is s general comment made for testing purposes',
    'This is s general comment made for testing purposes'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text('Apps'),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: apps.length,
        itemBuilder: (context, index) {
          return Dismissible(
              key: Key(apps[index]),
              child: NotificationTile(
                textString: apps[index],
                subString: appsDetails[index],
              ));
        },
      ),
    );
  }
}
