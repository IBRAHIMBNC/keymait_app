import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keymait_app/screens/auth_screens/widgets/socialMediaLoginButtons.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../constants.dart';
import '../../../widgets/smallText.dart';
import '../widgets/roundedButton.dart';
import '../widgets/signUpForm.dart';
import 'Signin_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Positioned(
            bottom: -5.h,
            child: Container(
                width: 100.w,
                child: Lottie.asset(
                  'assets/Json/waves.json',
                )),
          ),
          Container(
            height: 100.h,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 1.h,
                right: 8.w,
                left: 8.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SmallText(
                text: 'Create new Account',
                size: 13,
              ),
              SizedBox(
                height: 1.h,
              ),
              SignUpForm(),
              SizedBox(
                height: 4.h,
              ),
              const Align(
                child: SmallText(
                  size: 10,
                  text: 'Or Sign up with',
                  color: Colors.black38,
                ),
              ),
              SocialMediaButtons(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SmallText(
                    text: 'Already have an Account?',
                    size: 10,
                    color: Colors.black38,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.off(() => SignInScreen(),
                            transition: Transition.zoom,
                            duration: const Duration(milliseconds: 300));
                      },
                      child: const SmallText(
                        text: 'SIGN IN',
                        size: 10,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
