import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:keymait_app/screens/home_screen.dart';
import 'package:sizer/sizer.dart';

import '../../../constants.dart';
import '../../../widgets/bigTexT.dart';
import '../widgets/roundedButton.dart';
import 'Signin_screen.dart';
import 'signUp_screen.dart';

class ContinueAScreen extends StatelessWidget {
  const ContinueAScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.w,
        height: 100.h,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/hotelBal.jpg',
                ),
                fit: BoxFit.fitHeight)),
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
              SizedBox(
                height: 8.h,
              ),
              BigText(
                text: 'Continue as',
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(
                height: 2.h,
              ),
              SvgButton(
                bgColor: kSecondaryColor,
                svg: 'assets/icons/traveler.svg',
                text: 'TRAVELER',
                handler: () {
                  Get.off(() => HomeScreen());
                },
              ),
              SizedBox(height: 4.h),
              SvgButton(
                bgColor: Colors.white,
                svg: 'assets/icons/host.svg',
                text: 'HOST',
                textColor: kPrimaryColor,
                handler: () {},
              ),
            ]),
          )
        ]),
      ),
    );
  }
}

class SvgButton extends StatelessWidget {
  final String svg;
  final String text;
  final Color bgColor;
  final Color textColor;
  final Function()? handler;
  const SvgButton({
    Key? key,
    required this.svg,
    required this.text,
    required this.bgColor,
    this.textColor = Colors.white,
    this.handler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handler,
      child: Container(
        width: 70.w,
        height: 7.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(15)),
        child: Row(children: [
          SvgPicture.asset(
            svg,
            color: textColor,
            width: 6.w,
          ),
          Spacer(),
          BigText(
            size: 15,
            text: text,
            color: textColor,
          ),
          Spacer()
        ]),
      ),
    );
  }
}
