import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:work_id/constant/constant.dart';
import 'package:work_id/values/size_config.dart';

import 'contact/contact_page.dart';
import 'history/history_page.dart';
import 'home/home_page.dart';
import 'message/message_page.dart';
import 'setting/setting_page.dart';

class MainPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => MainPage());
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: MainPageBody(),
    );
  }
}

class MainPageBody extends StatefulWidget {
  @override
  _MainPageBodyState createState() => _MainPageBodyState();
}

class _MainPageBodyState extends State<MainPageBody> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePageBody(),
    MessagePage(),
    ContactPage(),
    HistoryPage(),
    SettingPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/ic_home_shape.svg",
                color:
                    _selectedIndex == 0 ? kPrimaryColor : kUnselectedBottomIcon,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/ic_mess.svg",
                color:
                    _selectedIndex == 1 ? kPrimaryColor : kUnselectedBottomIcon,
              ),
              label: "Message"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/ic_contact.svg",
                color:
                    _selectedIndex == 2 ? kPrimaryColor : kUnselectedBottomIcon,
              ),
              label: "Contact"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/ic_phone.svg",
                color:
                    _selectedIndex == 3 ? kPrimaryColor : kUnselectedBottomIcon,
              ),
              label: "History"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/ic_setting.svg",
                color:
                    _selectedIndex == 4 ? kPrimaryColor : kUnselectedBottomIcon,
              ),
              label: "Setting")
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 5,
        backgroundColor: Colors.white,
      ),
    );
  }
}
