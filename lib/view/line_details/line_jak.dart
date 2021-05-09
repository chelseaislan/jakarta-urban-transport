import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl_access_clone/const.dart';
import 'package:krl_access_clone/controller/transport_line_types_controller.dart';
import 'package:krl_access_clone/view/home_screen/card_page.dart';
import 'package:krl_access_clone/view/home_screen/home_page.dart';
import 'package:krl_access_clone/view/line_details/line_mrt.dart';

class LineJAK extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: NavAppBar(
        appBarColor: kPrimaryColor,
        appBarText: "Line Details",
        textColor: kWhite,
      ),
      body: ListView(
        children: [
          LineDetailHeader(
            headerIconData: Icons.directions_car_rounded,
            headerTitle: "Jak Lingko",
            headerDescription:
                "The most popular way of transport inside Jakarta.",
            headerIconColor: Colors.lightBlue[300],
          ),
          LineGridHeader(gridHeader: "All the operating lines"),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: GetX<JAKLinesController>(
              init: JAKLinesController(),
              initState: (_) {},
              builder: (controller) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.2,
                    crossAxisSpacing: 0.5,
                    maxCrossAxisExtent: 300,
                    mainAxisExtent: 170,
                  ),
                  itemCount: controller.jakLineTypes.length,
                  itemBuilder: (context, index) {
                    return GridSquareCard(
                      iconColor: controller.jakLineTypes[index].iconColor,
                      lineName: controller.jakLineTypes[index].lineName,
                      lineStatus: controller.jakLineTypes[index].lineStatus,
                      cardIcon: controller.jakLineTypes[index].cardIcon,
                      onItemTap: controller.jakLineTypes[index].onItemTap,
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