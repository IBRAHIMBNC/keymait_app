import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:keymait_app/constants.dart';
import 'package:keymait_app/screens/home_screen.dart';
import 'package:keymait_app/screens/profile_screen/widgets/chocolateLogo.dart';
import 'package:keymait_app/screens/profile_screen/widgets/roundedIconButton.dart';
import 'package:keymait_app/screens/profile_screen/widgets/category.dart';
import 'package:keymait_app/widgets/smallText.dart';
import 'package:sizer/sizer.dart';

import 'selectTypeOfPlace_screen.dart';

class AddHostingScreen extends StatefulWidget {
  AddHostingScreen({Key? key}) : super(key: key);

  @override
  State<AddHostingScreen> createState() => _AddHostingScreenState();
}

class _AddHostingScreenState extends State<AddHostingScreen> {
  int currentStep = 0;
  List<Widget> steps = [PlaceCategory(), TypeOfPlace()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: 100.w,
          height: 100.h,
          child: Stack(children: [
            SizedBox(
              width: 100.w,
              height: 23.h,
              child: Stack(children: [
                Positioned(
                  left: 0,
                  top: -23.h,
                  child: Image.asset(
                    'assets/pngs/Mask Group 219.png',
                    fit: BoxFit.fitWidth,
                    width: 100.w,
                    // width: 100.w,
                  ),
                ),
                Positioned(
                  top: 5.h,
                  left: 20.w,
                  child: Image.asset(
                    'assets/Logo/keymaitChocolate.png',
                    width: 60.w,
                  ),
                ),
                Positioned(
                    top: 11.h,
                    right: 0,
                    child: RoundedIconButton(
                      func: () {
                        Get.back();
                      },
                      picture: SvgPicture.asset('assets/icons/Group 16805.svg'),
                    )),
              ]),
            ),
            Positioned(
              bottom: 2.h,
              child: Column(
                children: [
                  PlaceCategory(),
                  CustomButton(
                    name: 'Next',
                    ontap: () {
                      Get.to(() => TypeOfPlace(),
                          transition: Transition.rightToLeft);
                    },
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String name;
  final Function()? ontap;
  final Color bgColor;
  const CustomButton({
    Key? key,
    required this.name,
    this.ontap,
    this.bgColor = kPrimaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: 80.w,
        height: 7.h,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Spacer(
            flex: 4,
          ),
          SmallText(
            color: Colors.white,
            size: 14,
            text: name,
          ),
          Spacer(
            flex: 3,
          ),
          const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          )
        ]),
      ),
    );
  }
}
