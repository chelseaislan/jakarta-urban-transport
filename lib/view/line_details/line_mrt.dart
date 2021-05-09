import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl_access_clone/const.dart';
import 'package:krl_access_clone/controller/transport_line_types_controller.dart';
import 'package:krl_access_clone/view/home_screen/card_page.dart';
import 'package:krl_access_clone/view/home_screen/history_page.dart';
import 'package:krl_access_clone/view/home_screen/home_page.dart';

class LineMRT extends StatelessWidget {
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
            headerIconData: Icons.subway_rounded,
            headerTitle: "MRT Jakarta",
            headerDescription:
                "Currently, MRTJ have only one line, from Lebak Bulus to Bundaran HI.",
            headerIconColor: Colors.blue[800],
          ),
          LineGridHeader(gridHeader: "All the operating lines"),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: GetX<MRTLinesController>(
              init: MRTLinesController(),
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
                  itemCount: controller.mrtLineTypes.length,
                  itemBuilder: (context, index) {
                    return GridSquareCard(
                      iconColor: controller.mrtLineTypes[index].iconColor,
                      lineName: controller.mrtLineTypes[index].lineName,
                      lineStatus: controller.mrtLineTypes[index].lineStatus,
                      cardIcon: controller.mrtLineTypes[index].cardIcon,
                      onItemTap: controller.mrtLineTypes[index].onItemTap,
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

class LineDetailHeader extends StatelessWidget {
  const LineDetailHeader({
    Key key,
    @required this.headerIconData,
    @required this.headerTitle,
    @required this.headerDescription,
    @required this.headerIconColor,
  }) : super(key: key);

  final IconData headerIconData;
  final String headerTitle;
  final String headerDescription;
  final Color headerIconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 25),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          TrainIcons(cardIcon: headerIconData, iconColor: headerIconColor),
          SizedBox(width: 20),
          Flexible(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    headerTitle,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: kWhite,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    headerDescription,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: kWhite,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
