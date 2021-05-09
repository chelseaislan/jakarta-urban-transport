import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl_access_clone/const.dart';
import 'package:krl_access_clone/controller/transport_types_controller.dart';
import 'package:krl_access_clone/controller/slider_controller.dart';
import 'package:krl_access_clone/view/home_screen/card_page.dart';
import 'package:krl_access_clone/view/account/login_page.dart';

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
                GetX<SliderController>(
                  init: SliderController(),
                  initState: (_) {},
                  builder: (controller) {
                    return CarouselSlider.builder(
                      itemCount: controller.sliderInfo.length,
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          child: Image.asset(
                            "assets/images/${controller.sliderInfo[index].sliderImgPath}",
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: 180,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 4),
                        autoPlayAnimationDuration: Duration(milliseconds: 500),
                        autoPlayCurve: Curves.ease,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                    );
                  },
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: MyTextField(
                    isObscure: false,
                    myHintText: "Search stations/shelters",
                    myInputType: TextInputType.text,
                    myPrefix: Icons.search_outlined,
                  ),
                ),
              ],
            ),
          ),
          LineGridHeader(gridHeader: "All the operating companies"),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: GetX<TransportTypesController>(
              init: TransportTypesController(),
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
                  itemCount: controller.transportTypes.length,
                  itemBuilder: (context, index) {
                    return GridSquareCard(
                      iconColor: controller.transportTypes[index].iconColor,
                      lineName: controller.transportTypes[index].transportName,
                      lineStatus:
                          controller.transportTypes[index].transportStatus,
                      cardIcon: controller.transportTypes[index].cardIcon,
                      onItemTap: controller.transportTypes[index].onItemTap,
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

class LineGridHeader extends StatelessWidget {
  const LineGridHeader({
    Key key,
    @required this.gridHeader,
  }) : super(key: key);

  final String gridHeader;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Text(
        gridHeader,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: kPrimaryBlack,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class GridSquareCard extends StatelessWidget {
  final Color iconColor;
  final String lineName;
  final String lineStatus;
  final IconData cardIcon;
  final Function onItemTap;

  const GridSquareCard({
    Key key,
    this.iconColor,
    this.lineName,
    this.lineStatus,
    this.cardIcon,
    this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemTap,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kWhite,
              iconColor.withBlue(230).withGreen(230).withRed(230),
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
            SizedBox(height: 10),
            Text(
              lineName,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: kPrimaryBlack,
                height: 1.5,
                letterSpacing: 0.5,
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
      ),
    );
  }
}
