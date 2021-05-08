import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl_access_clone/model/dashboard_lines.dart';

class DashboardLineController extends GetxController {
  List<DashboardLines> dashboardLines = <DashboardLines>[].obs;

  @override
  void onInit() {
    fetchLines();
    super.onInit();
  }

  void fetchLines() {
    var lineResult = [
      DashboardLines(
          "Central Line", "Perjalanan Normal", Colors.red, Icons.train_rounded),
      DashboardLines(
          "Cikarang Line", "Gangguan Sinyal", Colors.blue, Icons.train_rounded),
      DashboardLines(
          "Loop Line", "Perjalanan Normal", Colors.amber, Icons.train_rounded),
      DashboardLines("Tangerang Line", "Gangguan Sinyal", Colors.brown,
          Icons.train_rounded),
      DashboardLines("Rangkas Line", "Perjalanan Normal", Colors.green,
          Icons.train_rounded),
      DashboardLines(
          "Tj. Priuk Line", "Unknown", Colors.pink, Icons.train_rounded),
      DashboardLines("MRTJ Line 1", "Perjalanan Normal", Colors.blue[800],
          Icons.subway_rounded),
      DashboardLines("LRTJ Line 1", "Perjalanan Normal", Colors.red[800],
          Icons.subway_rounded),
      DashboardLines("LRT Jabo Line 1", "Perjalanan Normal", Colors.red[800],
          Icons.subway_rounded),
    ];
    dashboardLines.assignAll(lineResult);
  }
}
