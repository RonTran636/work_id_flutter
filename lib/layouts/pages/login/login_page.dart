import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_id/layouts/pages/main/main_page.dart';
import 'package:work_id/values/size_config.dart';
import 'package:work_id/constant/constant.dart';
import 'package:work_id/values/style.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark, statusBarColor: Colors.white),
        elevation: 0,
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
  late String userEmail;
  late String userPassword;
  @override
  Widget build(BuildContext context) {
    return Column(
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
              decoration: InputDecoration(
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
              decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset("assets/icons/ic_lock.svg"),
                  )),
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 12, defaultMargin, 0),
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
            padding:
                const EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
            child: Container(
                width: SizeConfig.screenWidth,
                child: Styles.defaultButton(
                    "Login",
                    kPrimaryColor,
                    () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainPageBody()))))),
        Padding(
            padding: const EdgeInsets.fromLTRB(
                defaultMargin, defaultMargin, defaultMargin, 0),
            child: Container(
              width: SizeConfig.screenWidth,
              child: Styles.defaultButton(
                  "Create Account", defaultOrange, () => {}),
            )),
      ],
    );
  }
}
