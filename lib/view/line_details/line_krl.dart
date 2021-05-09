import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl_access_clone/const.dart';
import 'package:krl_access_clone/controller/transport_line_types_controller.dart';
import 'package:krl_access_clone/view/home_screen/card_page.dart';
import 'package:krl_access_clone/view/home_screen/home_page.dart';

import 'line_mrt.dart';

class LineKRL extends StatelessWidget {
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
            headerIconData: Icons.train_rounded,
            headerTitle: "KRL Commuter Line",
            headerDescription:
                "Serving the Greater Jakarta Region's daily commute since the 90s.",
            headerIconColor: Colors.red,
          ),
          LineGridHeader(gridHeader: "All the operating lines"),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: GetX<KRLLinesController>(
              init: KRLLinesController(),
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
                  itemCount: controller.krlLineTypes.length,
                  itemBuilder: (context, index) {
                    return GridSquareCard(
                      iconColor: controller.krlLineTypes[index].iconColor,
                      lineName: controller.krlLineTypes[index].lineName,
                      lineStatus: controller.krlLineTypes[index].lineStatus,
                      cardIcon: controller.krlLineTypes[index].cardIcon,
                      onItemTap: controller.krlLineTypes[index].onItemTap,
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
