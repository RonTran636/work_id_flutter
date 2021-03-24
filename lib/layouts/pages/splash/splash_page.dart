import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:work_id/constant/constant.dart';

class SplashPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Image.asset("assets/images/logo.jpg")
      ),
    );
  }
}