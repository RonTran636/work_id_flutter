import 'dart:core';
import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_id/constant/constant.dart';
import 'package:work_id/layouts/pages/login/login_page.dart';
import 'package:work_id/values/size_config.dart';
import 'package:work_id/values/strings.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  PageController controller = PageController();
  List<Map<String, String>> onBoardContent = [
    {
      "image": "assets/images/on_board_slide_1.png",
      "title": Strings.onBoardingTitle1,
      "description": Strings.onBoardingHeader1
    },
    {
      "image": "assets/images/on_board_slide_2.png",
      "title": Strings.onBoardingTitle2,
      "description": Strings.onBoardingHeader2
    },
    {
      "image": "assets/images/on_board_slide_3.png",
      "title": Strings.onBoardingTitle3,
      "description": Strings.onBoardingHeader3
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  onPressed: moveToLogin,
                  child: Text(
                    "Skip",
                    textAlign: TextAlign.end,
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.roboto(
                        fontSize: getProportionateScreenHeight(mediumFontSize),
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: PageView.builder(
                      itemCount: onBoardContent.length,
                      controller: controller,
                      onPageChanged: (value) => {
                            this.setState(() {
                              currentPage = value;
                            })
                          },
                      itemBuilder: (context, index) => Content(
                            key: Key("OnboardContent"),
                            image: onBoardContent[index]["image"]!,
                            title: onBoardContent[index]["title"]!,
                            description: onBoardContent[index]["description"]!,
                          )),
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(onBoardContent.length,
                              (index) => buildDot(index)),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                          width: SizeConfig.screenWidth,
                          child: ElevatedButton(
                            onPressed: () => onBoardLoadMore(currentPage),
                            child: Text('Explore'),
                            style: ElevatedButton.styleFrom(
                              primary: kPrimaryColor, // background
                              onPrimary: Colors.white, // foreground
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            )),
      ),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 18),
      height: 8,
      width: currentPage == index ? 20 : 8,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : unSeletecedDot,
          borderRadius: BorderRadius.circular(8)),
      duration: kAnimationDuration,
    );
  }

  void onBoardLoadMore(int current) {
    developer.log('onBoardLoadMore', name: '$current');
    if (current < onBoardContent.length - 1) {
      setState(() {
        controller.jumpToPage(current + 1);
      });
    } else {
      setState(() {
        moveToLogin();
      });
    }
  }

  void moveToLogin() {
    Get.off(()=>LoginPage());
  }
}

class Content extends StatelessWidget {
  const Content(
      {required Key key,
      required this.title,
      required this.description,
      required this.image})
      : super(key: key);
  final String title, description, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Image.asset(
            image,
            width: SizeConfig.screenWidth,
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(title,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  fontSize: getProportionateScreenHeight(largeFontSize),
                  color: defaultOrange,
                  fontWeight: FontWeight.bold)),
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
              fontSize: getProportionateScreenHeight(onBoardingDescriptionFont),
              color: defaultGrey,
              fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}
