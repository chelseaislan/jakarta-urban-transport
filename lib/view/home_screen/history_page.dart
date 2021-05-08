import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl_access_clone/const.dart';
import 'package:krl_access_clone/controller/trip_history_controller.dart';
import 'package:krl_access_clone/view/home_screen/card_page.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: NavAppBar(
        appBarText: "Trip History",
        appBarColor: kWhite,
        textColor: kPrimaryBlack,
      ),
      body: GetX<TripHistoryController>(
        init: TripHistoryController(),
        initState: (_) {},
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.tripHistory.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      kWhite,
                      controller.tripHistory[index].iconColor
                          .withRed(255)
                          .withGreen(247)
                          .withBlue(219)
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
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            spreadRadius: 0.5,
                            color: kPrimaryGrey,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Icon(
                            controller.tripHistory[index].cardIcon,
                            color: controller.tripHistory[index].iconColor,
                            size: 30,
                          ),
                          Text(
                            controller.tripHistory[index].cardIcon ==
                                    Icons.subway_rounded
                                ? "MRT"
                                : "KRL",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: kPrimaryBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Flexible(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.tripHistory[index].title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: kSecondaryBlack,
                              ),
                            ),
                            Text(
                              controller.tripHistory[index].description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: kPrimaryBlack,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                                "${controller.tripHistory[index].date}, ${controller.tripHistory[index].time}"),
                          ],
                        ),
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
