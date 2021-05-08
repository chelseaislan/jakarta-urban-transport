import 'package:flutter/cupertino.dart';

class TripHistoryInfo {
  final IconData cardIcon;
  final Color iconColor;
  final String date;
  final String time;
  final String title;
  final String description;

  TripHistoryInfo(
    this.cardIcon,
    this.date,
    this.time,
    this.title,
    this.description,
    this.iconColor,
  );
}
