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
                          .withRed(230)
                          .withGreen(230)
                          .withBlue(230)
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
                    TrainIcons(
                        cardIcon: controller.tripHistory[index].cardIcon,
                        iconColor: controller.tripHistory[index].iconColor),
                    SizedBox(width: 15),
                    Flexible(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.tripHistory[index].title,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: kSecondaryBlack,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              controller.tripHistory[index].description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: kPrimaryBlack,
                                letterSpacing: 0.5,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              "${controller.tripHistory[index].date}, ${controller.tripHistory[index].time}",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: kPrimaryBlack,
                              ),
                            ),
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

class TrainIcons extends StatelessWidget {
  const TrainIcons({
    Key key,
    @required this.cardIcon,
    @required this.iconColor,
  }) : super(key: key);

  final IconData cardIcon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            cardIcon,
            color: iconColor,
            size: 30,
          ),
          Text(
            cardIcon == Icons.subway_rounded
                ? "MRT"
                : cardIcon == Icons.train_rounded
                    ? "KRL"
                    : cardIcon == Icons.subway_outlined
                        ? "LRT"
                        : cardIcon == Icons.directions_bus_rounded
                            ? "TJ"
                            : "JAK",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: kPrimaryBlack,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
