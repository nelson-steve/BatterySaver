import 'package:battery_saver_app/pages/feature_pages/app_usage.dart';
import 'package:battery_saver_app/pages/feature_pages/battery_health.dart';
import 'package:battery_saver_app/pages/feature_pages/battery_remaining_time.dart';
import 'package:flutter/material.dart';

class FeatureTile extends StatefulWidget {
  FeatureTile(
      {Key? key,
      required this.height,
      required this.featureValue,
      required this.featureName})
      : super(key: key);
  double height;
  int featureValue;
  String featureName = "";

  @override
  State<FeatureTile> createState() => _FeatureTileState();
}

class _FeatureTileState extends State<FeatureTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => featureCall(widget.featureValue)),
      child: Container(
        height: widget.height,
        color: Colors.white,
        child: Row(
          children: [
            Text(widget.featureName),
          ],
        ),
      ),
    );
  }

  void featureCall(int x) {
    if (x == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => AppUsage())));
    } else if (x == 2) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => BatteryHealth())));
    } else if (x == 3) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: ((context) => BatteryRemainingTime())));
    }
  }
}
