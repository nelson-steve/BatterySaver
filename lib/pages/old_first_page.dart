import 'dart:async';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:battery_saver_app/utils/Text1.dart';
import 'package:battery_saver_app/utils/apps_list.dart';
import 'package:battery_saver_app/utils/constants.dart';
import 'package:battery_saver_app/utils/issues.dart';
import 'package:battery_saver_app/utils/neu_button.dart';
import 'package:battery_saver_app/utils/notification_tile.dart';
import 'package:battery_saver_app/utils/percentage_indicator.dart';
import 'package:battery_saver_app/utils/settings.dart';
import 'package:battery_saver_app/utils/summary_notification.dart';
import 'package:battery_saver_app/utils/text_status.dart';
import 'package:battery_saver_app/utils/text_status1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/enums/charging_status.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:battery_saver_app/utils/notification_service.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<String> apps = ['app1', 'app2', 'app3'];
  List<String> appsDetails = [
    'This is s general comment made for testing purposes',
    'This is s general comment made for testing purposes',
    'This is s general comment made for testing purposes'
  ];
  int batteryP = 21; // test variables ****** need to go
  final List<int> values = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigoAccent,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 80,
                    ),
                    PercentageIndicator(),
                    Container(
                      height: 8.5,
                      width: 8.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Container(
                          height: 7,
                          width: 7,
                          decoration: BoxDecoration(
                            color: batteryP > 20 ? Colors.green : Colors.red,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          NeuButton(button: 'Health', statement: ''),
                          SizedBox(
                            width: 10,
                          ),
                          textStatus(
                            backgroundColor: Colors.amber,
                            textString: 'good',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          NeuButton(button: 'Capacity', statement: ''),
                          SizedBox(
                            width: 10,
                          ),
                          textStatus(
                            backgroundColor: Colors.amber,
                            textString: '200mAh',
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          NeuButton(button: 'Temperature', statement: ''),
                          SizedBox(
                            width: 10,
                          ),
                          textStatus(
                            backgroundColor: Colors.amber,
                            textString: '23C',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          NeuButton(button: 'Charging', statement: ''),
                          SizedBox(
                            width: 10,
                          ),
                          textStatus(
                            backgroundColor: Colors.amber,
                            textString: 'yes',
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              )
            ]),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              height: double.infinity,
              child: Column(
                children: [
                  Container(
                    height: 40,
                    color: Colors.amber,
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 5,
                          height: 5,
                        ),
                        Text('List of Apps'),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: ((context) => AppsList()))),
                                child: Icon(
                                  Icons.menu,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: GestureDetector(
                                onTap: () => PopUp(
                                    title: "Info",
                                    text: "Apps using the most battery.",
                                    additionalInfo:
                                        "Slide the apps to dismiss."),
                                child: Icon(
                                  Icons.question_mark,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                          ],
                        ),
                      ],
                    )),
                  ),
                  ListView.builder(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future PopUp(
      {String title = "Title",
      String text = "Info",
      String additionalInfo = ""}) async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                title,
              ),
              content: Container(
                height: 40,
                child: Column(
                  children: [Text(text), Text(additionalInfo)],
                ),
              ),
            ));
  }
}

////////////////////////////////***Not being Called***/////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class Page extends StatefulWidget {
  const Page({Key? key}) : super(key: key);

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  String batteryPercentage = "12";
  String batteryHealth = "null";
  String batteryTemperature = "null";
  String batteryChargingStatus = "null";
  String batteryTime = "null";

  // @override
  // void initState() {
  //   super.initState();
  //   Timer.periodic(const Duration(seconds: 2), (timer) {
  //     batteryLevel();
  //   });
  //   Timer.periodic(const Duration(seconds: 2), (timer) {
  //     batteryH();
  //   });
  //   Timer.periodic(const Duration(seconds: 2), (timer) {
  //     batteryTemp();
  //   });
  //   Timer.periodic(const Duration(seconds: 2), (timer) {
  //     batteryCharging();
  //   });
  //   Timer.periodic(const Duration(seconds: 2), (timer) {
  //     batteryRemainingTime();
  //   });
  //   tz.initializeTimeZones();
  // }

  @override
  Widget build(BuildContext context) {
    var batteryIndicator = int.parse(batteryPercentage);
    // batteryCharged();
    return Expanded(
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircularPercentIndicator(
                  // backgroundColor: base2,
                  animation: true,
                  restartAnimation: true,
                  animationDuration: 2000,
                  radius: 150,
                  lineWidth: 3,
                  percent: batteryIndicator / 100,
                  progressColor:
                      batteryIndicator > 15 ? compliment1 : compliment2,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: AvatarGlow(
                    endRadius: 50,
                    glowColor: compliment2,
                    repeat: false,
                    child: Center(
                      child: StreamBuilder<AndroidBatteryInfo>(
                          builder: ((context, snapshot) {
                        return Text(
                          batteryPercentage,
                        );
                      })),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text1(
                            textString: 'Health',
                            textColor: Colors.white,
                            textFont: 15,
                          ),
                          textStatus(
                            backgroundColor: compliment1,
                            textString: batteryHealth,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text1(
                            textString: 'Temperature',
                            textColor: Colors.white,
                            textFont: 15,
                          ),
                          textStatus(
                            backgroundColor: compliment1,
                            textString: batteryTemperature,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text1(
                            textString: 'Charging',
                            textColor: Colors.white,
                            textFont: 15,
                          ),
                          textStatus(
                            backgroundColor: compliment1,
                            textString: batteryChargingStatus,
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(4.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       const Text1(
                    //         textString: 'Time',
                    //         textColor: Colors.white,
                    //         textFont: 15,
                    //       ),
                    //       textStatus(
                    //         backgroundColor: compliment1,
                    //         textString: "20 minutes",
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          ),
          Expanded(
            flex: 1,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.amber,
                      ),
                      // height: 80,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Center(
                              child: textStatus1(
                                backgroundColor: base2,
                                textString: 'Battery Consuming Apps',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4, right: 4),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Issues(notificationString: 'HiLauncher'),
                                Issues(notificationString: 'WhatsApp'),
                                Issues(notificationString: 'Gallery'),
                                // Issues(notificationString: ''),
                              ],
                            ),
                          )
                        ],
                      ),
                      // backgroundColor: Colors.blueAccent,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
//   void batteryLevel() async {
//     String b =
//         await "${(await BatteryInfoPlugin().androidBatteryInfo)?.batteryLevel}";
//     setState(() {
//       batteryPercentage = b;
//     });
//   }

//   void batteryH() async {
//     String b =
//         await "${(await BatteryInfoPlugin().androidBatteryInfo)?.health}";
//     setState(() {
//       batteryHealth = b;
//     });
//   }

//   void batteryTemp() async {
//     String b =
//         await "${(await BatteryInfoPlugin().androidBatteryInfo)?.temperature}";
//     setState(() {
//       batteryTemperature = b;
//     });
//   }

//   void batteryCharging() async {
//     String b =
//         await "${(await BatteryInfoPlugin().androidBatteryInfo)?.chargingStatus.toString().split(".")[1]}";
//     setState(() {
//       batteryChargingStatus = b;
//     });
//   }

//   void batteryVoltage() async {
//     String b =
//         await "${(await BatteryInfoPlugin().androidBatteryInfo)?.voltage}";
//     setState(() {});
//   }

//   void batteryRemainingTime() async {
//     // var x;
//     String b =
//         // "${((await BatteryInfoPlugin().androidBatteryInfo)!.chargeTimeRemaining! / 1000 / 60).truncate()}";
//         await "${(await BatteryInfoPlugin().androidBatteryInfo)?.chargeTimeRemaining}";
//     // var x = int.parse(b);
//     // x = x * 1000;
//     setState(() {
//       batteryTime = b;
//       // batteryTime = x.truncate().toString();
//     });
//   }

//   void batteryCharged() {
//     var batteryPerc = int.parse(batteryPercentage);
//     if (batteryPerc == 21) {
//       NotificationService()
//           .showNotification(1, "Battery Saver App", 'Battery fully charged', 5);
//     }
//   }
}
