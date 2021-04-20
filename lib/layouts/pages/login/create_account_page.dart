import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_id/constant/constant.dart';
import 'package:work_id/values/size_config.dart';
import 'package:work_id/values/strings.dart';
import 'package:work_id/values/style.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  late String _signUpEmail;
  late String _signUpPassword;
  late String _signUpDisplayName;
  late bool _obscureText;
  bool termChecked = true;

  @override
  void initState() {
    _obscureText = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * 0.965,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(0, defaultMargin, defaultMargin, 0),
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
              padding:
                  const EdgeInsets.fromLTRB(defaultMargin, defaultMargin, 0, 0),
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
                  onSaved: (value) => _signUpEmail = value!,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      labelText: "Email",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset("assets/icons/ic_email.svg"),
                      )),
                )),
            Padding(
                padding: const EdgeInsets.all(defaultMargin),
                child: TextFormField(
                  obscureText: _obscureText,
                  keyboardType: TextInputType.text,
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
                  validator: (value) =>
                      value!.length < 6 ? 'Password too short' : null,
                  onSaved: (value) => _signUpPassword = value!,
                )),
            Padding(
                padding: const EdgeInsets.all(defaultMargin),
                child: TextFormField(
                  onSaved: (value) => _signUpDisplayName = value!,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      labelText: "Display name",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset("assets/icons/ic_person.svg"),
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
                      _signUpEmail, _signUpPassword, _signUpDisplayName)),
            )
          ],
        ),
      ),
    );
  }

  _registerWithEmailAndPassword(
      String email, String password, String displayName) {}
}
