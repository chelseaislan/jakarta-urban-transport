import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl_access_clone/model/card_history_info.dart';

class CardHistoryController extends GetxController {
  List<CardHistoryInfo> cardHistory = <CardHistoryInfo>[].obs;

  @override
  void onInit() {
    fetchCard();
    super.onInit();
  }

  void fetchCard() {
    var cardResult = [
      CardHistoryInfo(Icons.arrow_circle_down_rounded, "MRT Jakarta",
          "28 February 2021", "17:00", "8"),
      CardHistoryInfo(Icons.arrow_circle_down_rounded, "KRL Commuter Line",
          "26 February 2021", "08:00", "5"),
      CardHistoryInfo(Icons.arrow_circle_up_rounded, "Top-Up",
          "25 February 2021", "22:00", "100"),
      CardHistoryInfo(Icons.arrow_circle_down_rounded, "KRL Commuter Line",
          "25 February 2021", "09:00", "6"),
      CardHistoryInfo(Icons.arrow_circle_up_rounded, "Top-Up",
          "25 February 2021", "22:00", "25"),
    ];
    cardHistory.assignAll(cardResult);
  }
}
