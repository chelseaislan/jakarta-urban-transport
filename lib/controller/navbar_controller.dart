import 'package:flutter/material.dart';
import 'package:krl_access_clone/const.dart';
import 'package:krl_access_clone/view/home_screen/account_page.dart';
import 'package:krl_access_clone/view/home_screen/card_page.dart';
import 'package:krl_access_clone/view/home_screen/history_page.dart';
import 'package:krl_access_clone/view/home_screen/home_page.dart';
import 'package:krl_access_clone/view/home_screen/route_page.dart';

class HomeNavBar extends StatefulWidget {
  @override
  _HomeNavBarState createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  var selectedIndex = 0;
  var widgetOptions = [
    HomePage(),
    HistoryPage(),
    CardPage(),
    RoutePage(),
    AccountPage(),
  ];

  void onItemTap(var index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kWhite,
        elevation: 10,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kPrimaryGrey,
        selectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: kPrimaryColor,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: kPrimaryGrey,
        ),
        items: [
          navBarItem(Icons.home_outlined, "Home"),
          navBarItem(Icons.my_library_books_outlined, "History"),
          navBarItem(Icons.credit_card_outlined, "Pay"),
          navBarItem(Icons.map_outlined, "Route"),
          navBarItem(Icons.person_outlined, "Account"),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTap,
      ),
    );
  }

  BottomNavigationBarItem navBarItem(navIcon, navBarText) {
    return BottomNavigationBarItem(
      icon: Icon(navIcon),
      label: navBarText,
      tooltip: navBarText,
    );
  }
}
