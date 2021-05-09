import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl_access_clone/model/profile_info.dart';
import 'package:krl_access_clone/view/account/login_page.dart';
import 'package:krl_access_clone/view/other_screens/route_map.dart';

class ProfileController extends GetxController {
  var profileSettings = <ProfileSettings>[].obs;

  @override
  void onInit() {
    fetchProfileSettings();
    super.onInit();
  }

  void fetchProfileSettings() {
    var profileResult = [
      ProfileSettings(Icons.map_outlined, "Route Map", () {
        Get.to(() => RouteMap());
      }),
      ProfileSettings(
          Icons.help_outline_rounded, "Frequently Asked Questions", () {}),
      ProfileSettings(Icons.my_library_books_outlined, "Terms of Use", () {}),
      ProfileSettings(Icons.my_library_books_outlined, "Privacy Policy", () {}),
      ProfileSettings(Icons.info_outline_rounded, "About Us", () {}),
      ProfileSettings(Icons.logout, "Log Out", () {
        Get.defaultDialog(
          title: "Confirmation",
          content: Text("Log out from Jakarta Urban Access?"),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: Text("Log Out"),
              onPressed: () {
                Get.offAll(() => LoginPage());
              },
            ),
          ],
        );
      }),
    ];
    profileSettings.assignAll(profileResult);
  }
}
