import 'package:get/get.dart';
import 'package:krl_access_clone/model/slider_info.dart';

class SliderController extends GetxController {
  var sliderInfo = <SliderInfo>[].obs;

  @override
  void onInit() {
    fetchSlider();
    super.onInit();
  }

  void fetchSlider() {
    var sliderResult = [
      SliderInfo("banner1.jpg"),
      SliderInfo("banner2.png"),
      SliderInfo("banner3.png"),
      SliderInfo("banner4.png"),
      SliderInfo("banner5.png"),
    ];
    sliderInfo.assignAll(sliderResult);
  }
}
