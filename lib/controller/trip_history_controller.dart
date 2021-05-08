import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl_access_clone/model/trip_history_info.dart';

class TripHistoryController extends GetxController {
  List<TripHistoryInfo> tripHistory = <TripHistoryInfo>[].obs;

  @override
  void onInit() {
    fetchTrip();
    super.onInit();
  }

  void fetchTrip() {
    var tripResult = [
      TripHistoryInfo(Icons.subway_rounded, "28 February 2021", "17:00",
          "Tap OUT", "MRT Jakarta - St. Bundaran HI", Colors.blue[800]),
      TripHistoryInfo(Icons.subway_rounded, "28 February 2021", "16:00",
          "Tap IN", "MRT Jakarta - St. Lebak Bulus Grab", Colors.blue[800]),
      TripHistoryInfo(Icons.train_rounded, "26 February 2021", "08:00",
          "Tap OUT", "KRL Commuter Line - St. Sudirman", Colors.amber),
      TripHistoryInfo(Icons.train_rounded, "26 February 2021", "06:30",
          "Tap IN", "KRL Commuter Line - St. Bekasi", Colors.blue),
      TripHistoryInfo(Icons.train_rounded, "25 February 2021", "09:00",
          "Tap OUT", "KRL Commuter Line - St. Jakarta Kota", Colors.red),
      TripHistoryInfo(Icons.train_rounded, "25 February 2021", "07:30",
          "Tap IN", "KRL Commuter Line - St. Nambo", Colors.amber),
    ];
    tripHistory.assignAll(tripResult);
  }
}
