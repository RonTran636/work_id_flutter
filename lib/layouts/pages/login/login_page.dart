import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_id/constant/constant.dart';
import 'package:work_id/values/size_config.dart';
import 'package:work_id/values/strings.dart';
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
  late String _userEmail;
  late String _userPassword;
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = false;
    super.initState();
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
                  onSaved: (val) => val!=null? _userEmail = val : null,
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
                  onSaved: (val) => _userPassword = val!,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      labelText: "Password",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset("assets/icons/ic_lock.svg"),
                      )),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, defaultMargin, 0),
              child: TextButton(
                  // Change method here
                  onPressed: () {},
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
                    child: Styles.defaultButton("Explore", kPrimaryColor,
                        () => _loginWithEmailAndPassword()))),
            Padding(
                padding: const EdgeInsets.fromLTRB(
                    defaultMargin, defaultMargin, defaultMargin, 0),
                child: Container(
                    width: SizeConfig.screenWidth,
                    child: Styles.defaultButton("Create an account",
                        defaultOrange, () => _showSignUpBottomSheet()))),
          ],
        ),
      ),
    );
  }

  _showSignUpBottomSheet() {
    late String signUpEmail;
    late String signUpPassword;
    late String signUpDisplayName;
    bool termChecked = true;
    Get.bottomSheet(
        Container(
          height: SizeConfig.screenHeight * 0.965,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      0, defaultMargin, defaultMargin, 0),
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: kPrimaryColor,
                      size: 24.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      defaultMargin, defaultMargin, 0, 0),
                  child: Text(
                    "Create an account",
                    style: GoogleFonts.roboto(
                        fontSize: getProportionateScreenHeight(largeFontSize),
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(defaultMargin),
                    child: TextFormField(
                      onSaved: (value) => signUpEmail = value!,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          labelText: "Email",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child:
                                SvgPicture.asset("assets/icons/ic_email.svg"),
                          )),
                    )),
                Padding(
                    padding: const EdgeInsets.all(defaultMargin),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          labelText: "Password",
                          prefixIcon: Padding(
                              padding: const EdgeInsets.all(10),
                              child:
                                  SvgPicture.asset("assets/icons/ic_lock.svg")),
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
                      validator: (value) =>
                          value!.length < 6 ? 'Password too short' : null,
                      onSaved: (value) => signUpPassword = value!,
                      obscureText: _obscureText,
                    )),
                Padding(
                    padding: const EdgeInsets.all(defaultMargin),
                    child: TextFormField(
                      onSaved: (value) => signUpDisplayName = value!,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          labelText: "Display name",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child:
                                SvgPicture.asset("assets/icons/ic_person.svg"),
                          )),
                    )),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: defaultMargin),
                      child: Checkbox(
                          value: termChecked,
                          onChanged: (value) => {
                                setState(() {
                                  termChecked = value!;
                                })
                              }),
                    ),
                    Container(
                      padding: EdgeInsets.all(defaultMargin),
                      width: SizeConfig.screenWidth * 0.85,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: Strings.termAndPrivacyStart,
                                style: GoogleFonts.roboto(
                                    color: kPrimaryColor,
                                    fontSize: smallFontSize,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: Strings.termAndPrivacyKey,
                                style: GoogleFonts.roboto(
                                    color: hyperlinkText,
                                    fontSize: smallFontSize,
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    //TODO add Privacy web view
                                  }),
                            TextSpan(
                                text: Strings.termAndPrivacyEnd,
                                style: GoogleFonts.roboto(
                                    color: kPrimaryColor,
                                    fontSize: smallFontSize,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      defaultMargin, defaultMargin, defaultMargin, 0),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  width: SizeConfig.screenWidth,
                  child: Styles.defaultButton(
                      "Create my account",
                      defaultOrange,
                      () => _registerWithEmailAndPassword(
                          signUpEmail, signUpPassword, signUpDisplayName)),
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))));
  }

  _loginWithEmailAndPassword() {}

  _registerWithEmailAndPassword(
      String email, String password, String displayName) {}
}
