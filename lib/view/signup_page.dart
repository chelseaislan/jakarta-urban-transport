import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl_access_clone/view/login_page.dart';

import '../const.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(height: 30),
              LoginHeader(
                mySize: mySize,
                trainImage: "assets/images/train2.png",
                loginTitle: "Hello!",
                loginDesc: "Create a new account now!",
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MyTextField(
                    isObscure: false,
                    myPrefix: Icons.person_outlined,
                    myHintText: "Name",
                    myInputType: TextInputType.name,
                  ),
                  MyTextField(
                    isObscure: false,
                    myPrefix: Icons.email_outlined,
                    myHintText: "Email Address",
                    myInputType: TextInputType.emailAddress,
                  ),
                  MyTextField(
                    isObscure: true,
                    myPrefix: Icons.vpn_key_outlined,
                    myHintText: "Password",
                    myInputType: TextInputType.text,
                  ),
                ],
              ),

              Container(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child:
                      Text("I agree to the Terms of Use and Privacy Policy.")),
              // Potensial buat pake MVC
              ElevatedButtonFill(
                myPrimary: kPrimaryColor,
                onItemPressed: () {},
                myText: "Create Account",
                textColor: kWhite,
              ),
              TextButton(
                onPressed: () {
                  Get.offAll(LoginPage());
                },
                child: Text("Already registered? Sign in here."),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
