import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work_id/constant/constant.dart';
import 'package:work_id/layouts/pages/login/login_page.dart';
import 'package:work_id/layouts/pages/on_boarding/on_boarding_page.dart';
import 'package:work_id/values/size_config.dart';
import 'package:work_id/values/strings.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _checkCurrentUser() {
    Future.delayed(Duration(milliseconds: 500),() async {
      final pref = await SharedPreferences.getInstance();
      final currentUser = pref.getString(USER_INFO) ?? null;
      if (currentUser == null){
        Get.off(()=>OnBoarding());
      }else{
        Get.off(()=>LoginPage());
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Image.asset("assets/images/logo.jpg"),
      ),
    );
  }
}

