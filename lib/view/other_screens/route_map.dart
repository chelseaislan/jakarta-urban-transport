import 'package:flutter/material.dart';
import 'package:krl_access_clone/const.dart';
import 'package:krl_access_clone/view/home_screen/card_page.dart';
import 'package:photo_view/photo_view.dart';

class RouteMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: NavAppBar(
        appBarColor: kWhite,
        appBarText: "Route Map",
        textColor: kPrimaryBlack,
      ),
      body: PhotoView(
        minScale: 0.15,
        imageProvider: AssetImage("assets/images/map.jpg"),
      ),
    );
  }
}
