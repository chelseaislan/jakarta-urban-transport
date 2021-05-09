import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl_access_clone/const.dart';
import 'package:krl_access_clone/controller/transport_line_types_controller.dart';
import 'package:krl_access_clone/view/home_screen/card_page.dart';
import 'package:krl_access_clone/view/home_screen/home_page.dart';
import 'package:krl_access_clone/view/line_details/line_mrt.dart';

class LineTJN extends StatelessWidget {
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
            headerIconData: Icons.directions_bus_rounded,
            headerTitle: "Transjakarta Non BRT",
            headerDescription:
                "The most popular way of transport inside Jakarta.",
            headerIconColor: Colors.orange[800],
          ),
          LineGridHeader(gridHeader: "All the operating lines"),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: GetX<TJNLinesController>(
              init: TJNLinesController(),
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
                  itemCount: controller.tjnLineTypes.length,
                  itemBuilder: (context, index) {
                    return GridSquareCard(
                      iconColor: controller.tjnLineTypes[index].iconColor,
                      lineName: controller.tjnLineTypes[index].lineName,
                      lineStatus: controller.tjnLineTypes[index].lineStatus,
                      cardIcon: controller.tjnLineTypes[index].cardIcon,
                      onItemTap: controller.tjnLineTypes[index].onItemTap,
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