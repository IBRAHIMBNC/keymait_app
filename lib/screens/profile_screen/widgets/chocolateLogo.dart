import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Logo extends StatelessWidget {
  final double height;
  const Logo({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding.top;
    return SizedBox(
      child: Container(
        width: 100.w,
        height: height.h,
        child: Stack(children: [
          Positioned(
            left: 0,
            top: -height.h / 2,
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
        ]),
      ),
    );
  }
}
