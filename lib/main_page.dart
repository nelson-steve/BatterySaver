import 'package:battery_saver_app/pages/first_page.dart';
import 'package:battery_saver_app/pages/third_page.dart';
import 'package:battery_saver_app/utils/constants.dart';
import 'package:battery_saver_app/utils/settings.dart';
// import 'package:battery_saver_app/utils/hidden_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:battery_saver_app/pages/second_page.dart';
import 'package:usage_stats/usage_stats.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    UsageStats.grantUsagePermission();
  }

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> children = [
    FirstPage(),
    // SecondPage(),
    // ThirdPage(),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // currentIndex:
    // _currentIndex;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Battery Saver',
          style: TextStyle(
            fontFamily: 'Slabo',
            fontSize: 25,
            color: compliment1,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.indigoAccent,
        // centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => Setting())));
            },
            icon: Icon(Icons.settings),
          ),
        ],
        // leading: GestureDetector(
        // onTap: HiddenDrawer,
        //     child: const Icon(Icons.menu_rounded)),
      ),
      body: children[_currentIndex],
      bottomNavigationBar: Container(
        color: Colors.indigoAccent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
              // onTabChange: onTappedBar,
              // selectedIndex: _currentIndex,
              selectedIndex: 1,
              gap: 8,
              backgroundColor: Colors.indigoAccent,
              // hoverColor: Colors.amber,
              // rippleColor: Colors.amber,
              tabBackgroundColor: compliment1,
              // haptic: true,
              // color: Color.fromARGB(255, 79, 102, 230),
              color: Colors.transparent,
              activeColor: Colors.grey,
              tabs: const [
                GButton(
                  icon: Icons.notifications_rounded,
                  iconSize: 25,
                  text: 'Notification',
                  textStyle: TextStyle(
                    fontFamily: 'Slabo',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GButton(
                  icon: Icons.home,
                  iconSize: 25,
                  text: 'Home',
                  textStyle: TextStyle(
                    fontFamily: 'Slabo',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GButton(
                  icon: Icons.battery_full,
                  iconSize: 25,
                  text: 'Battery',
                  textStyle: TextStyle(
                    fontFamily: 'Slabo',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
