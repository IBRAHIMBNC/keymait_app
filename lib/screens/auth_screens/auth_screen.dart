import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';
import '../../widgets/bigTexT.dart';
import 'screens/Signin_screen.dart';
import 'screens/signUp_screen.dart';
import 'widgets/roundedButton.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.w,
        height: 100.h,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/mky-moody.jpg',
                ),
                fit: BoxFit.cover)),
        child: Stack(children: [
          Opacity(
            opacity: 0.8,
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [kSecondaryColor, kPrimaryColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                RoundedButton(
                  func: () {
                    Get.to(() => const SignUpScreen(),
                        transition: Transition.rightToLeft);
                  },
                  color: kSecondaryColor,
                  text: 'SIGN UP',
                  textColor: Colors.white,
                ),
                SizedBox(
                  height: 3.h,
                ),
                RoundedButton(
                  func: () {
                    Get.to(() => SignInScreen(),
                        transition: Transition.rightToLeft);
                  },
                  color: Colors.white,
                  text: 'SIGN IN',
                )
              ]),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/Logo/keymaitWhite.png',
                width: 55.w,
              ),
              SizedBox(
                height: 2.h,
              ),
              const BigText(text: 'Welcome to our \n Community!'),
            ]),
          )
        ]),
      ),
    );
  }
}
