import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keymait_app/controllers/auth_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../constants.dart';
import 'roundedButton.dart';

class SocialMediaButtons extends StatelessWidget {
  final AuthController authCont = Get.find();
  SocialMediaButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          RoundedButton(
            image: 'assets/images/google.png',
            textColor: Colors.white,
            text: 'Google',
            color: kPrimaryColor,
            func: authCont.signInWithGoogle,
            size: 40,
          ),
          SizedBox(
            width: 3.w,
          ),
          RoundedButton(
            image: 'assets/images/facebook.png',
            textColor: Colors.white,
            text: 'Facebook',
            color: kPrimaryColor,
            func: authCont.signInWithFb,
            size: 40,
          )
        ],
      ),
    );
  }
}
