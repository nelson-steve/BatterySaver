import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/enums/charging_status.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:flutter/material.dart';

class BatteryHealth extends StatefulWidget {
  BatteryHealth({Key? key}) : super(key: key);

  @override
  State<BatteryHealth> createState() => _BatteryHealthState();
}

class _BatteryHealthState extends State<BatteryHealth> {
  @override
  void initState() {
    super.initState();
    getBatteryCapacity();
  }

  String batteryHealth = "";
  String batteryWatts = "";
  String batteryCapacity = "";
  double BatteryTime = 0.0;
  double? watts = 0;
  double? amp = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery Info plugin example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<AndroidBatteryInfo?>(
                future: BatteryInfoPlugin().androidBatteryInfo,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                        'Battery Health: ${snapshot.data!.health?.toUpperCase()}');
                  }
                  return CircularProgressIndicator();
                }),
            SizedBox(
              height: 20,
            ),
            StreamBuilder<AndroidBatteryInfo?>(
                stream: BatteryInfoPlugin().androidBatteryInfoStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Text("Voltage: ${(snapshot.data?.voltage)} mV"),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            "Charging status: ${(snapshot.data?.chargingStatus.toString().split(".")[1])}"),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            "Battery Level: ${(snapshot.data?.batteryLevel)} %"),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            "Battery Capacity: ${((snapshot.data!.batteryCapacity)! / 1000)} mAh"),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Technology: ${(snapshot.data!.technology)} "),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            "Battery present: ${(snapshot.data?.present)! ? "Yes" : "False"} "),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Scale: ${(snapshot.data?.scale)} "),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            "Remaining energy: ${-((snapshot.data?.remainingEnergy)! * 1.0E-9)} Watt-hours,"),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            "Current Average: ${(snapshot.data?.currentAverage)},"),
                        SizedBox(
                          height: 20,
                        ),
                        _getChargeTime(snapshot.data!),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Capacity: ${batteryCapacity}"),
                        SizedBox(
                          height: 20,
                        ),
                        _calculateTime(snapshot.data!),
                      ],
                    );
                  }
                  return CircularProgressIndicator();
                })
          ],
        ),
      ),
    );
  }

  Widget _getChargeTime(AndroidBatteryInfo data) {
    if (data.chargingStatus == ChargingStatus.Charging) {
      return data.chargeTimeRemaining == -1
          ? Text("Calculating charge time remaining")
          : Text(
              "Charge time remaining: ${(data.chargeTimeRemaining! / 1000 / 60).truncate()} minutes");
    }
    return Text("Battery is full or not connected to a power source");
  }

  Widget _calculateTime(AndroidBatteryInfo data) {
    // ((snapshot.data!.batteryCapacity)! / 1000)
    amp = (data.batteryCapacity)! / 1000;
    // -((snapshot.data?.remainingEnergy)! * 1.0E-9)
    watts = -((data.remainingEnergy)! * 1.0E-9);
    BatteryTime = (10 * amp!) / watts!;
    return Text("Battery Time: ${BatteryTime}");
  }

  void getBatteryCapacity() async {
    String b =
        await "${(await BatteryInfoPlugin().androidBatteryInfo)?.batteryCapacity}";
    setState(() {
      batteryCapacity = b;
    });
  }
}







  // Scaffold(
  //     appBar: AppBar(
  //       title: Text("Battery Health ${batteryHealth}"),
  //     ),
  //     body: Container(
  //       color: Colors.white,
  //       child: Text("Battery Health ${batteryWatts}"),
  //     ),
  //   );


  //   void getBatteryHealth() async {
  //   String b =
  //       await "${(await BatteryInfoPlugin().androidBatteryInfo)?.health}";
  //   setState(() {
  //     batteryHealth = b;
  //   });
  // }

  // void getBatteryRemainingWatts() async {
  //   String b =
  //       await "${(await BatteryInfoPlugin().androidBatteryInfo)?.remainingEnergy}";
  //   setState(() {
  //     batteryWatts = b;
  //   });
  // }