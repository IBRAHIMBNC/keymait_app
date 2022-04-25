import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants.dart';
import '../../../widgets/smallText.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function()? func;
  final Color textColor;
  final double size;
  String? image;

  RoundedButton(
      {Key? key,
      required this.text,
      required this.color,
      required this.func,
      this.textColor = kPrimaryColor,
      this.size = 50,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Container(
        alignment: Alignment.center,
        width: size.w,
        height: 7.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.h),
          color: color,
        ),
        child: image == null
            ? SmallText(
                size: 13,
                text: text,
                color: textColor,
                fontWeight: FontWeight.bold,
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    if (image != null)
                      Image.asset(
                        image!,
                        width: 30,
                      ),
                    SizedBox(
                      width: 3.w,
                    ),
                    SmallText(
                      size: 13,
                      text: text,
                      color: textColor,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
