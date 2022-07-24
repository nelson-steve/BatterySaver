import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class BatteryRemainingTime extends StatefulWidget {
  const BatteryRemainingTime({Key? key}) : super(key: key);

  @override
  State<BatteryRemainingTime> createState() => _BatteryRemainingTimeState();
}

class _BatteryRemainingTimeState extends State<BatteryRemainingTime> {
  double battery = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Battery Remaining Time',
          style: TextStyle(
            fontFamily: 'Slabo',
            fontSize: 25,
            color: compliment1,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.indigoAccent,
      ),
      body: StreamBuilder<AndroidBatteryInfo?>(
          stream: BatteryInfoPlugin().androidBatteryInfoStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              battery =
                  (((snapshot.data!.batteryCapacity)! / 1000) + 600) / 284;

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 2,
                  ),
                  Column(
                    children: [
                      Text(
                        "On average use the battery should last:",
                        style: TextStyle(fontFamily: 'Slabo', fontSize: 22),
                      ),
                      Text(
                        "Hours: ${battery}",
                        style: TextStyle(fontFamily: 'Slabo', fontSize: 22),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 2,
                  ),
                ],
              );
              // Text(
              //     "Battery Capacity: ${((snapshot.data!.batteryCapacity)! / 1000) + 600} mAh")
            } else {
              return Text("Na");
            }
          }),
    );
  }
}
