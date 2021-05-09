import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl_access_clone/const.dart';
import 'package:krl_access_clone/controller/navbar_controller.dart';
import 'package:krl_access_clone/view/account/signup_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mySize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(height: 30),
              LoginHeader(
                mySize: mySize,
                trainImage: "assets/images/train1.png",
                loginTitle: "Welcome back!",
                loginDesc: "Sign in to use Jakarta Urban Transport.",
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
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
                  TextButton(
                    onPressed: () {},
                    child: Text("Forgot password?"),
                  ),
                ],
              ),
              SizedBox(height: 60),
              // Potensial buat pake MVC
              ElevatedButtonFill(
                myPrimary: kPrimaryColor,
                onItemPressed: () {
                  Get.offAll(() => HomeNavBar());
                },
                myText: "Sign In",
                textColor: kWhite,
              ),
              ElevatedButtonLogo(
                myPrimary: kPrimaryBlack,
                onItemPressed: () {},
                myText: "Continue with Google",
                logoPath: "assets/images/google.png",
              ),
              ElevatedButtonLogo(
                myPrimary: kPrimaryBlack,
                onItemPressed: () {},
                myText: "Continue with Facebook",
                logoPath: "assets/images/fb.png",
              ),
              TextButton(
                onPressed: () {
                  Get.offAll(() => SignupPage());
                },
                child: Text("New user? Sign up here."),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class ElevatedButtonLogo extends StatelessWidget {
  final Color myPrimary;
  final String myText;
  final String logoPath;
  final Function onItemPressed;
  const ElevatedButtonLogo({
    Key key,
    this.myPrimary,
    this.myText,
    this.onItemPressed,
    this.logoPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(top: 6, bottom: 3),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: myPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onItemPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              logoPath,
              width: 20,
            ),
            SizedBox(width: 10),
            Text(
              myText,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: kWhite,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ElevatedButtonFill extends StatelessWidget {
  final Color myPrimary;
  final Color textColor;
  final String myText;
  final Function onItemPressed;
  const ElevatedButtonFill({
    Key key,
    this.myPrimary,
    this.myText,
    this.onItemPressed,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(top: 6, bottom: 3),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: myPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onItemPressed,
        child: Text(
          myText,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: textColor,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final String myHintText;
  final IconData myPrefix;
  final bool isObscure;
  final TextInputType myInputType;
  const MyTextField({
    Key key,
    this.myHintText,
    this.myPrefix,
    this.isObscure,
    this.myInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3),
      child: TextFormField(
        obscureText: isObscure,
        keyboardType: myInputType,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.only(top: 20),
          fillColor: kWhite,
          filled: true,
          hintText: myHintText,
          prefixIcon: Icon(myPrefix),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: kPrimaryGrey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: kSecondaryColor),
          ),
        ),
      ),
    );
  }
}

class LoginHeader extends StatelessWidget {
  final String trainImage;
  final String loginTitle;
  final String loginDesc;
  const LoginHeader({
    Key key,
    @required this.mySize,
    this.trainImage,
    this.loginTitle,
    this.loginDesc,
  }) : super(key: key);

  final Size mySize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 40, bottom: 20),
          child: Image.asset(
            trainImage,
            width: mySize.width * 0.3,
          ),
        ),
        Text(
          loginTitle,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: kPrimaryBlack,
          ),
        ),
        Text(
          loginDesc,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: kSecondaryBlack,
          ),
        ),
      ],
    );
  }
}
