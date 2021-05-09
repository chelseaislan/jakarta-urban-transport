import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl_access_clone/const.dart';
import 'package:krl_access_clone/controller/navbar_controller.dart';
import 'package:krl_access_clone/view/account/login_page.dart';

class PaymentSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: kWhite,
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/finish.png"),
                Text(
                  "Payment Complete!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryBlack,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "You have successfully top-up your balance.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kPrimaryBlack,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 25),
                ElevatedButtonFill(
                  myText: "Go to Dashboard",
                  myPrimary: kPrimaryColor,
                  onItemPressed: () => Get.offAll(() => HomeNavBar()),
                  textColor: kWhite,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
