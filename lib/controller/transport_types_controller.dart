import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl_access_clone/model/transport_type_info.dart';
import 'package:krl_access_clone/view/line_details/line_jak.dart';
import 'package:krl_access_clone/view/line_details/line_krl.dart';
import 'package:krl_access_clone/view/line_details/line_lrt.dart';
import 'package:krl_access_clone/view/line_details/line_mrt.dart';
import 'package:krl_access_clone/view/line_details/line_tjb.dart';
import 'package:krl_access_clone/view/line_details/line_tjn.dart';

class TransportTypesController extends GetxController {
  var transportTypes = <TransportTypes>[].obs;

  @override
  void onInit() {
    fetchTransport();
    super.onInit();
  }

  void fetchTransport() {
    var transportDetails = [
      TransportTypes("KRL Commuter Line", "Disrupted Service", Colors.red,
          Icons.train_rounded, () {
        Get.to(() => LineKRL());
      }),
      TransportTypes("MRT Jakarta", "Normal Operation", Colors.blue[900],
          Icons.subway_rounded, () {
        Get.to(() => LineMRT());
      }),
      TransportTypes("LRTJ & LRT Jabo", "Normal Operation", Colors.red,
          Icons.subway_outlined, () {
        Get.to(() => LineLRT());
      }),
      TransportTypes("Transjakarta (BRT)", "Disrupted Service",
          Colors.lightBlue[800], Icons.directions_bus_rounded, () {
        Get.to(() => LineTJB());
      }),
      TransportTypes("Transjakarta (Non BRT)", "Normal Operation",
          Colors.orange, Icons.directions_bus_rounded, () {Get.to(() => LineTJN());}),
      TransportTypes("Transjakarta (Jak Lingko)", "Normal Operation",
          Colors.lightBlue[300], Icons.directions_car_rounded, () {Get.to(() => LineJAK());}),
    ];
    transportTypes.assignAll(transportDetails);
  }
}
