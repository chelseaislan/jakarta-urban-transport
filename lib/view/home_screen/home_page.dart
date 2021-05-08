import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl_access_clone/const.dart';
import 'package:krl_access_clone/controller/dashboard_lines_controller.dart';
import 'package:krl_access_clone/view/home_screen/card_page.dart';
import 'package:krl_access_clone/view/login_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: NavAppBar(
        appBarText: "Jakarta Urban Transport",
        appBarColor: kPrimaryColor,
        textColor: kWhite,
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                  height: 150,
                  decoration: BoxDecoration(
                    color: kPrimaryGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: MyTextField(
                    isObscure: false,
                    myHintText: "Search stations for train departures",
                    myInputType: TextInputType.text,
                    myPrefix: Icons.search_outlined,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Text(
              "All the operating KRL lines",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: kPrimaryBlack,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: GetX<DashboardLineController>(
              init: DashboardLineController(),
              initState: (_) {},
              builder: (controller) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.2,
                    crossAxisSpacing: 0.5,
                    maxCrossAxisExtent: 300,
                    mainAxisExtent: 150,
                  ),
                  itemCount: controller.dashboardLines.length,
                  itemBuilder: (context, index) {
                    return DashboardCard(
                      iconColor: controller.dashboardLines[index].iconColor,
                      lineName: controller.dashboardLines[index].lineName,
                      lineStatus: controller.dashboardLines[index].lineStatus,
                      cardIcon: controller.dashboardLines[index].cardIcon,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final Color iconColor;
  final String lineName;
  final String lineStatus;
  final IconData cardIcon;

  const DashboardCard({
    Key key,
    this.iconColor,
    this.lineName,
    this.lineStatus,
    this.cardIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            kWhite,
            iconColor.withRed(255).withGreen(247).withBlue(219),
          ],
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            cardIcon,
            size: 50,
            color: iconColor,
          ),
          SizedBox(height: 5),
          Text(
            lineName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: kPrimaryBlack,
              height: 1.5,
            ),
          ),
          Text(
            lineStatus,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: kPrimaryBlack,
            ),
          ),
        ],
      ),
    );
  }
}
