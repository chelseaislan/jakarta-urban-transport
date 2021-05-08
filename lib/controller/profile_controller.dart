import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl_access_clone/model/profile_info.dart';
import 'package:krl_access_clone/view/login_page.dart';

class ProfileController extends GetxController {
  var profileSettings = <ProfileSettings>[].obs;

  @override
  void onInit() {
    fetchProfileSettings();
    super.onInit();
  }

  void fetchProfileSettings() {
    var profileResult = [
      ProfileSettings(Icons.map_outlined, "Route Map", () {}),
      ProfileSettings(
          Icons.help_outline_rounded, "Frequently Asked Questions", () {}),
      ProfileSettings(Icons.my_library_books_outlined, "Terms of Use", () {}),
      ProfileSettings(Icons.my_library_books_outlined, "Privacy Policy", () {}),
      ProfileSettings(Icons.info_outline_rounded, "About Us", () {}),
      ProfileSettings(Icons.logout, "Log Out", () {
        Get.offAll(LoginPage());
      }),
    ];
    profileSettings.assignAll(profileResult);
  }
}
