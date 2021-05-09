import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl_access_clone/const.dart';
import 'package:krl_access_clone/controller/card_history_controller.dart';
import 'package:krl_access_clone/view/account/login_page.dart';
import 'package:krl_access_clone/view/other_screens/recent_activity.dart';
import 'package:krl_access_clone/view/other_screens/top_up_page.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mySize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhite,
      appBar: NavAppBar(
        appBarText: "My Card",
        appBarColor: kWhite,
        textColor: kPrimaryBlack,
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hold near the reader to tap in/out"),
              SizedBox(width: 5),
              Icon(
                Icons.contactless_outlined,
                size: 15,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            padding: EdgeInsets.all(20),
            height: mySize.height * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [Colors.black, Colors.deepOrange[700]],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Multi Trip Card",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: kWhite,
                      ),
                    ),
                    Text(
                      "4356 2058 3054 1982",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: kWhite,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CardIcons(
                          cardIconData: Icons.train_rounded,
                        ),
                        CardIcons(
                          cardIconData: Icons.subway_rounded,
                        ),
                        CardIcons(
                          cardIconData: Icons.subway_outlined,
                        ),
                        CardIcons(
                          cardIconData: Icons.directions_bus_rounded,
                        ),
                        CardIcons(
                          cardIconData: Icons.directions_car_rounded,
                        ),
                      ],
                    ),
                    CardIcons(
                      cardIconData: Icons.contactless_outlined,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.amber[50], Colors.red[100]],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  spreadRadius: 0.5,
                  color: kPrimaryGrey,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Balance",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: kPrimaryBlack,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Rp123",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: kPrimaryBlack,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                ElevatedButtonFill(
                  myPrimary: kPrimaryColor,
                  myText: "Top-Up",
                  onItemPressed: () {
                    Get.to(() => TopUpPage());
                  },
                  textColor: kWhite,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  spreadRadius: 0.5,
                  color: kPrimaryGrey,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recent activity",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryBlack,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 10),
                GetX<CardHistoryController>(
                  init: CardHistoryController(),
                  initState: (_) {},
                  builder: (controller) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.cardHistory.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    controller.cardHistory[index].cardIcon,
                                    color: controller
                                                .cardHistory[index].cardIcon ==
                                            Icons.arrow_circle_down_rounded
                                        ? kPrimaryColor
                                        : Colors.teal,
                                  ),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.cardHistory[index].title,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: kPrimaryBlack,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      Text(
                                          "${controller.cardHistory[index].date}, ${controller.cardHistory[index].time}"),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                "Rp${controller.cardHistory[index].price}",
                                style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      controller.cardHistory[index].cardIcon ==
                                              Icons.arrow_circle_down_rounded
                                          ? kPrimaryColor
                                          : Colors.teal,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: 10),
                Center(
                  child: ElevatedButtonFill(
                    myPrimary: kPrimaryColor,
                    myText: "View More",
                    onItemPressed: () {
                      Get.to(() => RecentActivity());
                    },
                    textColor: kWhite,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavAppBar extends StatelessWidget with PreferredSizeWidget {
  final String appBarText;
  final Color appBarColor;
  final Color textColor;
  const NavAppBar({
    Key key,
    this.appBarText,
    this.appBarColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appBarColor,
      centerTitle: false,
      elevation: 0,
      iconTheme: IconThemeData(color: textColor),
      title: Text(
        appBarText,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.support_agent_outlined, color: textColor),
          onPressed: () {},
          tooltip: "Live Chat",
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class CardIcons extends StatelessWidget {
  final IconData cardIconData;
  const CardIcons({
    Key key,
    this.cardIconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5),
      child: Icon(
        cardIconData,
        color: kWhite,
        size: 30,
      ),
    );
  }
}
