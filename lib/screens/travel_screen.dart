import 'package:flutter/material.dart';
import 'package:keymait_app/widgets/bigTexT.dart';
import 'package:keymait_app/widgets/smallText.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart';

class TravelSceen extends StatelessWidget {
  const TravelSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            top: 0,
            child: Image.asset(
              'assets/images/explor.jpg',
              fit: BoxFit.cover,
              height: 100.h,
              width: 100.w,
            )),
        Opacity(
          opacity: 0.65,
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            BigText(
              text: 'Hello Temple!',
              size: 22,
            ),
            SmallText(
              text: 'Where would you love to Stay?',
              color: Colors.white,
              size: 11,
            )
          ]),
        )
      ]),
    );
  }
}
