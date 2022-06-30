import 'package:avatar_glow/avatar_glow.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:battery_saver_app/utils/constants.dart';
import 'package:battery_saver_app/utils/text_status.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentageIndicator extends StatefulWidget {
  const PercentageIndicator({Key? key}) : super(key: key);

  @override
  State<PercentageIndicator> createState() => _PercentageIndicatorState();
}

class _PercentageIndicatorState extends State<PercentageIndicator> {
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      // backgroundColor: base2,
      animation: true,
      restartAnimation: true,
      animationDuration: 2000,
      radius: 170,
      lineWidth: 3,
      percent: 20 / 100,
      progressColor: 20 > 15 ? compliment1 : compliment2,
      circularStrokeCap: CircularStrokeCap.round,
      center: AvatarGlow(
        endRadius: 50,
        glowColor: compliment2,
        repeat: false,
        child: Center(
          child: StreamBuilder<AndroidBatteryInfo>(
            builder: ((context, snapshot) {
              // ignore: prefer_const_constructors
              return textStatus(
                backgroundColor: Colors.lightBlue,
                textString: '20%',
                fontSize: 30,
              );
            }),
          ),
        ),
      ),
    );
  }
}
