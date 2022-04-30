import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:keymait_app/screens/profile_screen/screens/addHosting_screen.dart';
import 'package:keymait_app/screens/profile_screen/screens/featureSelection_screen.dart';
import 'package:keymait_app/screens/profile_screen/widgets/chocolateLogo.dart';
import 'package:keymait_app/screens/profile_screen/widgets/header.dart';
import 'package:keymait_app/screens/profile_screen/widgets/category.dart';
import 'package:keymait_app/screens/profile_screen/widgets/selectType.dart';
import 'package:sizer/sizer.dart';

import '../widgets/roundedIconButton.dart';

class TypeOfPlace extends StatelessWidget {
  const TypeOfPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Stack(children: [
          Positioned(
            top: 0,
            child: SizedBox(
              width: 100.w,
              height: 38.h,
              child: Stack(children: [
                Positioned(
                  left: 0,
                  top: -12.h,
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
                Positioned(
                  top: 29.h,
                  child: Header(
                      title: 'Type of Place you Hosting?',
                      onPressed: () {
                        Get.back();
                      }),
                ),
                Positioned(
                  right: 0,
                  bottom: 10.h,
                  child: RoundedIconButton(
                      func: () {
                        Get.close(3);
                      },
                      picture:
                          SvgPicture.asset('assets/icons/Group 16805.svg')),
                ),
              ]),
            ),
          ),
          Positioned(
              bottom: 3.h,
              child: Column(children: [
                SelectPlaceType(),
                CustomButton(
                    name: 'Next',
                    ontap: () {
                      Get.to(() => SelectFeatures());
                    })
              ]))
        ]),
      ),
    );
  }
}
// Column(children: [
//           Stack(children: [
//             SizedBox(
//               width: 100.w,
//               height: 40.h,
//               child: Stack(children: [
//                 Positioned(
//                   left: 0,
//                   top: -10.h,
//                   child: Image.asset(
//                     'assets/pngs/Mask Group 219.png',
//                     fit: BoxFit.fitWidth,
//                     width: 100.w,
//                     // width: 100.w,
//                   ),
//                 ),
//                 Positioned(
//                   top: 10.h,
//                   left: 20.w,
//                   child: Image.asset(
//                     'assets/Logo/keymaitChocolate.png',
//                     width: 60.w,
//                   ),
//                 ),
//               ]),
//             ),
            // Positioned(
            //   right: 0,
            //   bottom: 0,
            //   child: RoundedIconButton(
            //       func: () {
            //         Get.close(3);
            //       },
            //       picture: SvgPicture.asset('assets/icons/Group 16805.svg')),
            // )
//           ]),
//           Header(
//               title: 'Type of Place you Hosting?',
//               onPressed: () {
//                 Get.back();
//               }),
//           SelectPlaceType(),
//           CustomButton(
//               name: 'Next',
//               ontap: () {
//                 Get.to(() => SelectFeatures());
//               })
//         ]),