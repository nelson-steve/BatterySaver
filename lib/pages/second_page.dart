import 'package:battery_saver_app/utils/apps_list.dart';
import 'package:battery_saver_app/utils/constants.dart';
import 'package:battery_saver_app/utils/notification_service.dart';
import 'package:battery_saver_app/utils/notification_tile.dart';
import 'package:battery_saver_app/utils/summary_notification.dart';
import 'package:battery_saver_app/utils/text_status.dart';
import 'package:battery_saver_app/utils/text_status1.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  // String value;
  SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<String> warnings = ['Warning1', 'Warning', 'Warning'];
  List<String> warningsDetails = [
    'This is a warning saying you should do something about it or not whatever you want',
    'This is a warning saying you should do something about it or not whatever you want',
    'This is a warning saying you should do something about it or not whatever you want'
  ];
  Color notifColor = compliment1;
  bool buttonPressed = false;
  Color backColor = grey;
  String notificationsToggle = 'ON';

  @override
  Widget build(BuildContext context) {
    notifColor = buttonPressed ? compliment1 : compliment2;
    backColor = buttonPressed ? base1 : shadow;
    notificationsToggle = buttonPressed ? 'ON' : 'OFF';

    return Column(children: [
      Expanded(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.indigoAccent,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                GestureDetector(
                  // splashColor: Colors.black,
                  onLongPress: (() {
                    setState(() {
                      NotificationService()
                          .showNotification(1, "Kelly", 'Hi Nelson', 5);
                      buttonPressed = buttonPressed ? false : true;
                      // notifColor =
                      //     notifColor == compliment1 ? compliment2 : compliment1;
                      // backColor = buttonElevation ? shadow : base1;
                      // notificationsToggle = buttonElevation ? 'OFF' : 'ON';
                    });
                  }),
                  child: Container(
                    // duration: Duration(milliseconds: 1000),
                    // onEnd: ,
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: backColor,
                            spreadRadius: buttonPressed ? 0 : 1,
                            blurRadius: buttonPressed ? 0 : 8,
                          ),
                          // BoxShadow(),
                        ]),
                    child: Icon(
                      Icons.notifications_none_rounded,
                      size: 120,
                      color: notifColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: textStatus(
                    backgroundColor: Colors.amber,
                    textString: 'Notifications ' + notificationsToggle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: textStatus(
                    backgroundColor: Colors.amber,
                    textString: 'Warnings 10',
                    fontSize: 15,
                  ),
                ),
              ]),
        ),
      ),
      // Center(),
      Expanded(
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
                    Text('Warnings'),
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
                                additionalInfo: "Slide the apps to dismiss."),
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
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Dismissible(
                      key: Key(warnings[index]),
                      child: NotificationTile(
                        textString: warnings[index],
                        subString: warningsDetails[index],
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    ]);
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
