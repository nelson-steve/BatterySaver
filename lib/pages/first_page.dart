import 'package:battery_saver_app/pages/feature_pages/app_usage.dart';
import 'package:battery_saver_app/utils/feature_tile.dart';
import 'package:battery_saver_app/utils/notification_service.dart';
// import 'package:battery_saver_app/utils/notification_service.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    height = (height / 3);
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () => {},
            child: Container(
              color: Colors.amber,
              child: Center(
                child: Icon(
                  Icons.battery_0_bar,
                  size: 80,
                ),
              ),
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
                double wHeight = constraints.maxHeight / 3;
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
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
