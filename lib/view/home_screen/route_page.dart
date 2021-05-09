import 'package:flutter/material.dart';
import 'package:krl_access_clone/const.dart';
import 'package:krl_access_clone/view/home_screen/card_page.dart';
import 'package:krl_access_clone/view/account/login_page.dart';

class RoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: NavAppBar(
        appBarColor: kPrimaryColor,
        appBarText: "Route Finder",
        textColor: kWhite,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                MyTextField(
                  isObscure: false,
                  myHintText: "Departure Station",
                  myInputType: TextInputType.text,
                  myPrefix: Icons.person_pin_circle_outlined,
                ),
                MyTextField(
                  isObscure: false,
                  myHintText: "Arrival Station",
                  myInputType: TextInputType.text,
                  myPrefix: Icons.person_pin_circle_outlined,
                ),
                SizedBox(height: 10),
                ElevatedButtonFill(
                  myPrimary: kWhite,
                  myText: "Find Route",
                  onItemPressed: () {},
                  textColor: kPrimaryColor,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                DepArrStation(
                  stationName: "Bekasi",
                  stationTime: "15:40",
                  currentCondition: "Quite empty",
                ),
                TrainLine(
                  lineName: "Bekasi Line",
                  lineColor: Colors.blue,
                  lineDestination: "Jakarta Kota",
                  trainStatus: "Scheduled",
                  trainTime: "15:42",
                  nextTrainTime: "15:52",
                  trainStops: 7,
                ),
                DepArrStation(
                  stationName: "Manggarai",
                  stationTime: "16:30",
                  currentCondition: "Heavily crowded",
                ),
                ChangeLine(),
                TrainLine(
                  lineName: "Loop Line",
                  lineColor: Colors.amber,
                  lineDestination: "Angke",
                  trainStatus: "Scheduled",
                  trainTime: "16:42",
                  nextTrainTime: "16:52",
                  trainStops: 3,
                ),
                DepArrStation(
                  stationName: "Tanah Abang",
                  stationTime: "17:05",
                  currentCondition: "Heavily crowded",
                ),
                ChangeLine(),
                TrainLine(
                  lineName: "Rangkas Line",
                  lineColor: Colors.green,
                  lineDestination: "Rangkasbitung",
                  trainStatus: "Scheduled",
                  trainTime: "17:15",
                  nextTrainTime: "17:45",
                  trainStops: 18,
                ),
                DepArrStation(
                  stationName: "Rangkasbitung",
                  stationTime: "19:20",
                  currentCondition: "Crowded",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChangeLine extends StatelessWidget {
  const ChangeLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.run_circle_outlined),
              SizedBox(width: 10),
              Text("Change line"),
            ],
          ),
          Divider(
            height: 35,
            color: kPrimaryGrey,
          ),
        ],
      ),
    );
  }
}

class TrainLine extends StatelessWidget {
  const TrainLine({
    Key key,
    @required this.lineName,
    @required this.lineColor,
    @required this.lineDestination,
    @required this.trainStatus,
    @required this.trainTime,
    @required this.nextTrainTime,
    @required this.trainStops,
  }) : super(key: key);

  final String lineName;
  final Color lineColor;
  final String lineDestination;
  final String trainStatus;
  final String trainTime;
  final String nextTrainTime;
  final int trainStops;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
                        decoration: BoxDecoration(
                          color: lineColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          lineName,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: kWhite,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        lineDestination,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: kPrimaryBlack,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    trainStatus,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryBlack,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
              Text(
                trainTime,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryBlack,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Also at $nextTrainTime (Scheduled)",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: kPrimaryBlack,
                    ),
                  ),
                  Text(
                    "Going through $trainStops stop(s)",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryBlack,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              Icon(Icons.keyboard_arrow_right_rounded),
            ],
          ),
          Divider(
            height: 35,
            color: kPrimaryGrey,
          ),
        ],
      ),
    );
  }
}

class DepArrStation extends StatelessWidget {
  const DepArrStation({
    Key key,
    this.stationName,
    this.stationTime,
    this.currentCondition,
  }) : super(key: key);

  final String stationName;
  final String stationTime;
  final String currentCondition;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                stationName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryBlack,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                stationTime,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: kPrimaryBlack,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.group_outlined,
                    color: kPrimaryColor,
                  ),
                  Text(
                    " Condition: ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Text(
                    currentCondition,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: kPrimaryBlack,
                    ),
                  ),
                ],
              ),
              Icon(Icons.keyboard_arrow_right_rounded),
            ],
          ),
          Divider(
            height: 35,
            color: kPrimaryGrey,
          ),
        ],
      ),
    );
  }
}
