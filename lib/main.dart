import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'layouts/pages/splash/splash_page.dart';
import 'package:get/get.dart';



void main() {
  Get.put(GetxController);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Work Id',
      theme: ThemeData(
      ),
      home: SplashPage(),
    );
  }
}