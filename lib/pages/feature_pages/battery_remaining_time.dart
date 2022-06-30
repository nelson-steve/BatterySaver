import 'package:flutter/material.dart';

class BatteryRemainingTime extends StatefulWidget {
  const BatteryRemainingTime({Key? key}) : super(key: key);

  @override
  State<BatteryRemainingTime> createState() => _BatteryRemainingTimeState();
}

class _BatteryRemainingTimeState extends State<BatteryRemainingTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Battery Remaining Time"),
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
