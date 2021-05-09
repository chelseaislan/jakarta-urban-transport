import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl_access_clone/const.dart';
import 'package:krl_access_clone/controller/profile_controller.dart';
import 'package:krl_access_clone/view/home_screen/card_page.dart';

import '../account/login_page.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: NavAppBar(
        appBarColor: kPrimaryColor,
        appBarText: "My Account",
        textColor: kWhite,
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: kWhite,
                  radius: 53,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profpic.jpg"),
                    radius: 50,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Astrid S",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kWhite,
                  ),
                ),
                Text(
                  "astrids@hotmail.com",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: kWhite,
                  ),
                ),
                Text(
                  "Joined since 30 April 2020",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: kWhite,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 15),
                  child: ElevatedButtonFill(
                    myPrimary: kWhite,
                    myText: "Edit Profile",
                    onItemPressed: () {},
                    textColor: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          GetX<ProfileController>(
            init: ProfileController(),
            initState: (_) {},
            builder: (controller) {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.profileSettings.length,
                itemBuilder: (context, index) {
                  return ProfileSettings(
                    buttonIcon: controller.profileSettings[index].buttonIcon,
                    buttonText: controller.profileSettings[index].buttonText,
                    onItemTap: controller.profileSettings[index].onItemTap,
                  );
                },
              );
            },
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({
    Key key,
    @required this.buttonIcon,
    @required this.buttonText,
    @required this.onItemTap,
  }) : super(key: key);

  final IconData buttonIcon;
  final String buttonText;
  final Function onItemTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onItemTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  buttonIcon,
                  size: 24,
                  color: kPrimaryColor,
                ),
                SizedBox(width: 10),
                Text(
                  buttonText,
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
      ),
    );
  }
}
