import 'dart:ui';

import 'package:battery_saver_app/utils/Text1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _toggled1 = false;
  bool _toggled2 = false;
  bool _toggled3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text1(
          textColor: Colors.white,
          textFont: 25,
          textString: 'Setting',
        ),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              color: Colors.grey.shade100,
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: double.infinity,
                    color: Colors.white,
                    child: SwitchListTile(
                      autofocus: true,
                      title: Text('Background Processes'),
                      subtitle: Text('Toggle background processes ON/OFF'),
                      value: _toggled1,
                      onChanged: (bool value) {
                        setState(() {
                          _toggled1 = value;
                        });
                      },
                      secondary: Icon(Icons.ac_unit_sharp),
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    color: Colors.white,
                    child: SwitchListTile(
                      title: Text('Notification Sound'),
                      subtitle: Text('Turn the notification sound ON/OFF'),
                      value: _toggled2,
                      onChanged: (bool value) {
                        setState(() {
                          _toggled2 = value;
                        });
                      },
                      secondary: Icon(Icons.ac_unit_sharp),
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    color: Colors.white,
                    child: SwitchListTile(
                      title: Text('Do Not Disturb'),
                      subtitle:
                          Text('Make the app silent so it does not bother you'),
                      value: _toggled3,
                      onChanged: (bool value) {
                        setState(() {
                          _toggled3 = value;
                        });
                      },
                      secondary: Icon(Icons.ac_unit_sharp),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.grey.shade100,
              child: Center(
                  child: Column(
                children: [
                  Text1(
                    textColor: Colors.black54,
                    textFont: 20,
                    textString: 'Battery Saver',
                  ),
                  Icon(
                    Icons.battery_saver,
                    color: Colors.black54,
                  )
                ],
              )),
            ),
          )
        ],
      ),
    );
  }
}
