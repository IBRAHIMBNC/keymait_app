import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../constants.dart';
import '../../../controllers/auth_controller.dart';
import '../../../widgets/bigTexT.dart';
import '../../../widgets/smallText.dart';
import '../widgets/roundedButton.dart';
import '../widgets/signInForm.dart';
import '../widgets/socialMediaLoginButtons.dart';
import 'signUp_screen.dart';

class SignInScreen extends StatelessWidget {
  final authCont = Get.put(AuthController());
  SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
        Positioned(
          bottom: -5.h,
          child: SizedBox(
              width: 100.w,
              child: Lottie.asset(
                'assets/Json/waves.json',
              )),
        ),
        Container(
          height: 100.h,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top, right: 8.w, left: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 3.h),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/Logo/keymaitChocolate.png',
                  width: 45.w,
                ),
              ),
              SizedBox(height: 4.h),
              const BigText(
                text: 'Welcome Back!',
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
              const SmallText(text: 'Hello there, Login to continue'),
              SizedBox(height: 3.h),
              const SignInForm(),
              SizedBox(
                height: 4.h,
              ),
              const Align(
                child: SmallText(
                  size: 10,
                  text: 'Or Sign in with',
                  color: Colors.black38,
                ),
              ),
              SocialMediaButtons(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SmallText(
                    text: "Don't have an Account?",
                    size: 10,
                    color: Colors.black38,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.off(() => const SignUpScreen(),
                            transition: Transition.zoom,
                            duration: const Duration(milliseconds: 300));
                      },
                      child: const SmallText(
                        text: 'SIGN UP',
                        size: 10,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}
