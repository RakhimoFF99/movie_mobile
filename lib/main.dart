import 'package:flutter/material.dart';
import 'package:movie_app/screens/HomePage/HomePage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EMovie',
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Color(0xff181425),
          splashFactory: InkRipple.splashFactory,
        ),
        builder: EasyLoading.init(),
        home: HomePage());
  }
}
