import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:krl_access_clone/const.dart';
import 'package:krl_access_clone/view/account/login_page.dart';
import 'package:krl_access_clone/view/home_screen/card_page.dart';
import 'package:krl_access_clone/view/other_screens/payment_success.dart';

class TopUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: NavAppBar(
        appBarColor: kWhite,
        appBarText: "Top Up Balance",
        textColor: kPrimaryBlack,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Image.asset(
              "assets/images/metro.png",
              width: 250,
              height: 250,
            ),
            Text(
              "Input top-up amount:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: kPrimaryBlack,
                letterSpacing: 0.5,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: MyTextField(
                isObscure: false,
                myHintText: "Minimum Rp15",
                myInputType: TextInputType.number,
                myPrefix: Icons.money_rounded,
              ),
            ),
            GroupButton(
              isRadio: true,
              spacing: 5,
              onSelected: (index, isSelected) =>
                  print('button no. ${index + 1} is selected'),
              buttons: ["Rp25", "Rp50", "Rp100", "Rp200", "Rp500", "Rp100"],
              selectedTextStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: kWhite,
                letterSpacing: 0.5,
              ),
              selectedColor: kPrimaryColor,
              unselectedColor: kWhite,
              borderRadius: BorderRadius.circular(10),
              selectedBorderColor: kPrimaryColor,
              unselectedBorderColor: kPrimaryGrey,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 20, top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButtonFill(
                    myPrimary: kPrimaryColor,
                    myText: "Pay with Debit/Credit Card",
                    textColor: kWhite,
                    onItemPressed: () {
                      Get.to(() => PaymentSuccess());
                    },
                  ),
                  ElevatedButtonLogo(
                    logoPath: "assets/images/google.png",
                    myPrimary: kPrimaryBlack,
                    myText: "Pay with Google Pay",
                    onItemPressed: () {
                      Get.snackbar(
                        "Launching Google Pay",
                        "Confirm your payment using Google Pay.",
                        backgroundColor: kWhite,
                        animationDuration: Duration(milliseconds: 300),
                        boxShadows: [
                          BoxShadow(
                            blurRadius: 3,
                            spreadRadius: 0.5,
                            color: kPrimaryGrey,
                          ),
                        ],
                      );
                      // Get.to(() => PaymentSuccess());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
