import 'dart:developer' as developer;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_id/constant/constant.dart';
import 'package:work_id/controllers/login_controller.dart';
import 'package:work_id/layouts/pages/login/create_account_page.dart';
import 'package:work_id/utils/string_utils.dart';
import 'package:work_id/values/size_config.dart';
import 'package:work_id/values/style.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        backwardsCompatibility: false,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: LoginPageBody(),
    );
  }
}

class LoginPageBody extends StatefulWidget {
  @override
  _LoginPageBodyState createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  late bool _obscureText;
  final loginController = Get.put(LoginController());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void initState() {
    _obscureText = true;
    super.initState();
  }


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
                height: SizeConfig.screenHeight * 0.3,
                child: Image.asset("assets/images/logo.jpg"),
                alignment: Alignment(0, -0.6),
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36)))),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  defaultMargin, defaultMargin, defaultMargin, 0),
              child: TextFormField(
                  controller: emailController,
                  validator: (input) => input!.isValidEmail()
                      ? null
                      : "Invalid email, please try again",
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      labelText: "Email",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset("assets/icons/ic_email.svg"),
                      )),
                  autofocus: true),
            ),
            Padding(
                padding: const EdgeInsets.all(defaultMargin),
                child: TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      labelText: "Password",
                      prefixIcon: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset("assets/icons/ic_lock.svg")),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, defaultMargin, 0),
              child: TextButton(
                  // Change method here
                  onPressed: () => _showForgotPasswordPage,
                  child: Text("Forgot Password?",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.normal,
                          fontSize: mediumFontSize,
                          color: Colors.redAccent))),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(
                    defaultMargin, 0, defaultMargin, 0),
                child: Container(
                    width: SizeConfig.screenWidth,
                    child: Styles.defaultButton(
                        "Explore",
                        kPrimaryColor,
                        () => _loginWithEmailAndPassword(
                            emailController.text, passwordController.text)))),
            Padding(
                padding: const EdgeInsets.fromLTRB(
                    defaultMargin, defaultMargin, defaultMargin, 0),
                child: Container(
                    width: SizeConfig.screenWidth,
                    child: Styles.defaultButton("Create an account",
                        defaultOrange, () => _showSignUpPage()))),
          ],
        ),
      ),
    );
  }

  _showSignUpPage() {
    Get.bottomSheet(CreateAccountPage(),
        backgroundColor: Colors.white,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))));
  }

  _loginWithEmailAndPassword(String email, String password) {
    loginController.loginWithEmailAndPassword(email,password);
  }

  _showForgotPasswordPage() {}
}
