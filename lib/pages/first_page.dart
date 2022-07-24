import 'package:battery_info/model/android_battery_info.dart';
import 'package:battery_saver_app/pages/feature_pages/app_usage.dart';
import 'package:battery_saver_app/utils/feature_tile.dart';
import 'package:battery_saver_app/utils/notification_service.dart';
// import 'package:battery_saver_app/utils/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:battery_info/battery_info_plugin.dart';

import '../utils/constants.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int notif = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Battery Saver',
          style: TextStyle(
            fontFamily: 'Slabo',
            fontSize: 25,
            color: compliment1,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.indigoAccent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white60,
              // color: Colors.indigo.shade200,
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                  ),
                  Icon(
                    Icons.battery_0_bar,
                    color: Colors.black,
                    size: 80,
                  ),
                  StreamBuilder<AndroidBatteryInfo?>(
                      stream: BatteryInfoPlugin().androidBatteryInfoStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data!.batteryLevel! == 100 &&
                              notif == 0) {
                            notif = 1;
                            NotificationService().showNotification(1,
                                "Battery Fully Charged", 'Unplug Charger', 1);
                          }
                          if (snapshot.data!.batteryLevel! <= 90 &&
                              notif == 1) {
                            notif = 0;
                          }
                          return Text(
                            "${(snapshot.data!.batteryLevel)} %",
                            style: TextStyle(color: Colors.black, fontSize: 40),
                          );
                        } else {
                          return Text("NaN");
                        }
                      })
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Scaffold(
              appBar: AppBar(
                title: Text("Features"),
                centerTitle: true,
              ),
              body: LayoutBuilder(
                builder: ((context, constraints) {
                  double wHeight = constraints.maxHeight / 4;
                  return Column(
                    children: [
                      FeatureTile(
                        height: wHeight,
                        featureValue: 1,
                        featureName: "App Usage",
                      ),
                      FeatureTile(
                        height: wHeight,
                        featureValue: 2,
                        featureName: "Battery Health",
                      ),
                      FeatureTile(
                        height: wHeight,
                        featureValue: 3,
                        featureName: "Battery Remaining Time",
                      ),
                      FeatureTile(
                        height: wHeight,
                        featureValue: 4,
                        featureName: "Notification",
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
