import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:keymait_app/screens/profile_screen/screens/addHosting_screen.dart';
import 'package:keymait_app/screens/profile_screen/widgets/chocolateLogo.dart';
import 'package:keymait_app/screens/profile_screen/widgets/roundedIconButton.dart';
import 'package:keymait_app/widgets/bigTexT.dart';
import 'package:keymait_app/widgets/smallText.dart';
import 'package:sizer/sizer.dart';

class ProvideHostingScreen extends StatelessWidget {
  const ProvideHostingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green,
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Stack(
          children: [
            SizedBox(
              width: 100.w,
              height: 50.h,
              child: Stack(children: [
                Positioned(
                  left: 0,
                  top: -10.h,
                  child: Image.asset(
                    'assets/pngs/Mask Group 219.png',
                    fit: BoxFit.fitWidth,
                    width: 100.w,
                    // width: 100.w,
                  ),
                ),
                Positioned(
                  top: 10.h,
                  left: 20.w,
                  child: Image.asset(
                    'assets/Logo/keymaitChocolate.png',
                    width: 60.w,
                  ),
                ),
              ]),
            ),
            Positioned(
              top: 30.h,
              child: SizedBox(
                width: 95.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: RoundedIconButton(
                          func: () {
                            Get.back();
                          },
                          picture:
                              SvgPicture.asset('assets/icons/Group 16805.svg'),
                        )),
                    SizedBox(height: 2.h),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: BigText(
                        text: 'Add Your Hosting',
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: 80.w,
                        child: const SmallText(
                            height: 1.5,
                            size: 11,
                            textAlign: TextAlign.start,
                            text:
                                'You are almost there, Provide some details \ninformation about your hosting services for rooms, apartments, shared rooms etc.'),
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                          name: 'ADD MY HOSTING',
                          ontap: () {
                            Get.to(() => AddHostingScreen());
                          }),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
