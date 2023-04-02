import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/animatedContainer.dart';
import 'package:widgets/animatedcrossfade.dart';
import 'package:widgets/appbarscreen.dart';
import 'package:widgets/bottomnav.dart';
import 'package:widgets/cliprect.dart';
import 'package:widgets/clipscreen.dart';
import 'package:widgets/mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
     themeMode: ThemeMode.system,
      home: HomePage(),

    );
  }
}
