import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl_access_clone/model/transport_type_info.dart';

class KRLLinesController extends GetxController {
  var krlLineTypes = <TransportLineTypes>[].obs;

  @override
  void onInit() {
    fetchKRLLines();
    super.onInit();
  }

  void fetchKRLLines() {
    var krlLineDetails = [
      TransportLineTypes("Central Line", "Normal Operation", Colors.red, Icons.filter_1_outlined, () {}),
      TransportLineTypes("Cikarang Line", "Normal Operation", Colors.blue, Icons.filter_2_outlined, () {}),
      TransportLineTypes("Loop Line", "Normal Operation", Colors.amber, Icons.filter_3_outlined, () {}),
      TransportLineTypes("Rangkas Line", "Normal Operation", Colors.green, Icons.filter_4_outlined, () {}),
      TransportLineTypes(
          "Tangerang Line", "Normal Operation", Colors.brown, Icons.filter_5_outlined, () {}),
      TransportLineTypes(
          "Tj. Priuk Line", "Normal Operation", Colors.pink, Icons.filter_6_outlined, () {}),
    ];
    krlLineTypes.assignAll(krlLineDetails);
  }
}

class MRTLinesController extends GetxController {
  var mrtLineTypes = <TransportLineTypes>[].obs;

  @override
  void onInit() {
    fetchMRTLines();
    super.onInit();
  }

  void fetchMRTLines() {
    var mrtLineDetails = [
      TransportLineTypes(
          "MRT Line 1", "Normal Operation", Colors.blue[800], Icons.filter_1_outlined, () {}),
    ];
    mrtLineTypes.assignAll(mrtLineDetails);
  }
}

class LRTLinesController extends GetxController {
  var lrtLineTypes = <TransportLineTypes>[].obs;

  @override
  void onInit() {
    fetchLRTLines();
    super.onInit();
  }

  void fetchLRTLines() {
    var lrtLineDetails = [
      TransportLineTypes("LRTJ Line 1", "Normal Operation", Colors.red, Icons.filter_1_outlined, () {}),
      TransportLineTypes(
          "LRT Jabo Line B", "Normal Operation", Colors.red, Icons.format_bold_outlined, () {}),
    ];
    lrtLineTypes.assignAll(lrtLineDetails);
  }
}

class TJBLinesController extends GetxController {
  var tjbLineTypes = <TransportLineTypes>[].obs;

  @override
  void onInit() {
    fetchTJBLines();
    super.onInit();
  }

  void fetchTJBLines() {
    var tjbLineDetails = [
      TransportLineTypes(
          "Busway Line 1", "Normal Operation", Colors.red, Icons.filter_1_outlined, () {}),
      TransportLineTypes(
          "Busway Line 2", "Disrupted Service", Colors.blue[900], Icons.filter_2_outlined, () {}),
      TransportLineTypes(
          "Busway Line 3", "Normal Operation", Colors.yellow[600], Icons.filter_3_outlined, () {}),
      TransportLineTypes(
          "Busway Line 4", "Normal Operation", Colors.purple[900], Icons.filter_4_outlined, () {}),
      TransportLineTypes(
          "Busway Line 5", "Disrupted Service", Colors.brown, Icons.filter_5_outlined, () {}),
      TransportLineTypes(
          "Busway Line 6", "Normal Operation", Colors.lightGreen, Icons.filter_6_outlined, () {}),
      TransportLineTypes(
          "Busway Line 7", "Disrupted Service", Colors.pink, Icons.filter_7_outlined, () {}),
      TransportLineTypes(
          "Busway Line 8", "Normal Operation", Colors.pink[900], Icons.filter_8_outlined, () {}),
      TransportLineTypes(
          "Busway Line 9", "Normal Operation", Colors.teal, Icons.filter_9_outlined, () {}),
    ];
    tjbLineTypes.assignAll(tjbLineDetails);
  }
}

class TJNLinesController extends GetxController {
  var tjnLineTypes = <TransportLineTypes>[].obs;

  @override
  void onInit() {
    fetchTJNLines();
    super.onInit();
  }

  void fetchTJNLines() {
    var tjnLineDetails = [
      TransportLineTypes(
          "Metro Trans Line 1", "Normal Operation", Colors.orange[700], Icons.filter_1_outlined, () {}),
      TransportLineTypes(
          "Metro Trans Line 2", "Disrupted Service", Colors.orange[700], Icons.filter_2_outlined, () {}),
      TransportLineTypes(
          "Metro Trans Line 3", "Normal Operation", Colors.orange[700], Icons.filter_3_outlined, () {}),
      TransportLineTypes(
          "Metro Trans Line 4", "Normal Operation", Colors.orange[700], Icons.filter_4_outlined, () {}),
      TransportLineTypes(
          "Metro Trans Line 5", "Disrupted Service", Colors.orange[700], Icons.filter_5_outlined, () {}),
      TransportLineTypes(
          "Metro Trans Line 6", "Normal Operation", Colors.orange[700], Icons.filter_6_outlined, () {}),
    ];
    tjnLineTypes.assignAll(tjnLineDetails);
  }
}

class JAKLinesController extends GetxController {
  var jakLineTypes = <TransportLineTypes>[].obs;

  @override
  void onInit() {
    fetchJAKLines();
    super.onInit();
  }

  void fetchJAKLines() {
    var jakLineDetails = [
      TransportLineTypes(
          "Jak Lingko Line 1", "Normal Operation", Colors.lightBlue[300], Icons.filter_1_outlined, () {}),
      TransportLineTypes(
          "Jak Lingko Line 2", "Disrupted Service", Colors.lightBlue[300], Icons.filter_2_outlined, () {}),
      TransportLineTypes(
          "Jak Lingko Line 3", "Normal Operation", Colors.lightBlue[300], Icons.filter_3_outlined, () {}),
      TransportLineTypes(
          "Jak Lingko Line 4", "Normal Operation", Colors.lightBlue[300], Icons.filter_4_outlined, () {}),
      TransportLineTypes(
          "Jak Lingko Line 5", "Disrupted Service", Colors.lightBlue[300], Icons.filter_5_outlined, () {}),
      TransportLineTypes(
          "Jak Lingko Line 6", "Normal Operation", Colors.lightBlue[300], Icons.filter_6_outlined, () {}),
    ];
    jakLineTypes.assignAll(jakLineDetails);
  }
}