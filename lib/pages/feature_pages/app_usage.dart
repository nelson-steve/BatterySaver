import 'package:flutter/material.dart';
import 'dart:async';
import 'package:usage_stats/usage_stats.dart';

import '../../utils/constants.dart';

// Updated version //
class AppUsage extends StatefulWidget {
  @override
  _AppUsageState createState() => _AppUsageState();
}

class _AppUsageState extends State<AppUsage> {
  List<EventUsageInfo> events = [];

  @override
  void initState() {
    super.initState();
    //removed a '!' from after instance
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initUsage();
    });
  }

  Future<void> initUsage() async {
    UsageStats.grantUsagePermission();
    DateTime endDate = new DateTime.now();
    DateTime startDate = DateTime(2022, 7, 23, 0, 0, 0);

    List<EventUsageInfo> queryEvents =
        await UsageStats.queryEvents(startDate, endDate);

    this.setState(() {
      events = queryEvents.reversed.toList();
    });

    filterAppsList();
    filterAppsList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'App Usage',
            style: TextStyle(
              fontFamily: 'Slabo',
              fontSize: 25,
              color: compliment1,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.indigoAccent,
        ),
        body: Container(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(events[index].packageName.toString()),
                subtitle: Text(events[index].className.toString()),
                // subtitle: Text(
                //     "Last time used: ${DateTime.fromMillisecondsSinceEpoch(int.parse(events[index].timeStamp.toString())).toIso8601String()}"),
                // trailing: Text(events[index].eventType.toString()),
                // trailing: Text(events[index].className.toString()),
                // trailing: Text('null'),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: events.length,

            // itemCount: events.length,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            filterAppsList();
            // initUsage();
            setState(() {});
          },
          child: Icon(
            Icons.refresh,
          ),
          mini: true,
        ),
      ),
    );
  }

  void filterAppsList() {
    EventUsageInfo x, y;

    for (int i = 0; i < events.length; i++) {
      if (events[i].className == null) {
        events.removeAt(i);
      }
    }
    for (int i = 0; i < events.length; i++) {
      for (int j = i + 1; j < events.length; j++) {
        int a = int.parse(events[i].eventType.toString());
        int b = int.parse(events[j].eventType.toString());
        if (a < b) {
          y = events[i];
          events[i] = events[j];
          events[j] = y;
        }
      }
    }
    for (int i = 0; i < events.length; i++) {
      for (int j = i + 1; j < events.length; j++) {
        String a = events[i].packageName.toString();
        String b = events[j].packageName.toString();
        if (a == b) {
          events.removeAt(j);
        }
      }
    }
    // for (int i = 0; i < events.length; i++) {
    //   // String temp = events[i].packageName.toString();
    //   // temp.replaceAll("com.", "whatever")
    //   events[i].packageName.toString().replaceAll("com.", "replace");
    // }
  }
}
