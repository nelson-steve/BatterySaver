import 'package:battery_saver_app/main_page.dart';
import 'package:battery_saver_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

//updated

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: base1,
          // secondary: base,

          // or from RGB

          // primary: const Color(0xFF343A40),
          // secondary: const Color(0xFFFFC107),
        ),
      ),
      home: MainPage(),
    );
  }
}
