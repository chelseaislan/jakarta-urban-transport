import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl_access_clone/const.dart';
import 'package:krl_access_clone/controller/card_history_controller.dart';
import 'package:krl_access_clone/view/home_screen/card_page.dart';

class RecentActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: NavAppBar(
        appBarColor: kWhite,
        appBarText: "Recent Activity",
        textColor: kPrimaryBlack,
      ),
      body: GetX<CardHistoryController>(
        init: CardHistoryController(),
        initState: (_) {},
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.cardHistory.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [kWhite, Colors.amber[50]],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 0.5,
                      color: kPrimaryGrey,
                    )
                  ],
                ),
                margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          controller.cardHistory[index].cardIcon,
                          color: controller.cardHistory[index].cardIcon ==
                                  Icons.arrow_circle_down_rounded
                              ? kPrimaryColor
                              : Colors.teal,
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                        color: controller.cardHistory[index].cardIcon ==
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
    );
  }
}
