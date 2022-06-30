import 'package:battery_saver_app/utils/Text1.dart';
import 'package:battery_saver_app/utils/battery_health_details.dart';
import 'package:battery_saver_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  // String value;
  ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: grey1,
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.indigoAccent,
              width: double.infinity,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Battery Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Slabo',
                      ),
                    ),
                  ),
                  BatteryHealthDetails(
                    text1: 'Percentage',
                    text2: '12%',
                    textColor: white,
                    textFontSize: 20,
                  ),
                  BatteryHealthDetails(
                    text1: 'Health',
                    text2: 'Good',
                    textColor: white,
                    textFontSize: 20,
                  ),
                  BatteryHealthDetails(
                    text1: 'Temperature',
                    text2: '114F',
                    textColor: white,
                    textFontSize: 20,
                  ),
                  BatteryHealthDetails(
                    text1: 'Type',
                    text2: 'Li-Po',
                    textColor: white,
                    textFontSize: 20,
                  ),
                  BatteryHealthDetails(
                    text1: 'Capacity',
                    text2: '4000 mAh',
                    textColor: white,
                    textFontSize: 20,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                Expanded(
                    child: Column(
                  children: [
                    Slider(
                      value: 10,
                      min: 0,
                      max: 100,
                      activeColor: compliment2,
                      inactiveColor: white,
                      // inactiveColor: exp,
                      onChanged: ((value) {}),
                    ),
                    Slider(
                      value: 10,
                      min: 0,
                      max: 100,
                      activeColor: compliment2,
                      inactiveColor: white,
                      // inactiveColor: exp,
                      onChanged: ((value) {}),
                    ),
                  ],
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
