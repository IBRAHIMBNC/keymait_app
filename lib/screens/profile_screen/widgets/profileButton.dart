import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keymait_app/constants.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/smallText.dart';

class ProfileButtonCard extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final SvgPicture icon;
  final Color? iconBgColor;

  const ProfileButtonCard(
      {Key? key,
      required this.text,
      required this.icon,
      this.iconBgColor,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(bottom: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        height: 7.h,
        decoration: BoxDecoration(
            color: Color(0xffEEEEEE), borderRadius: BorderRadius.circular(15)),
        child: Row(children: [
          CircleAvatar(
            radius: 2.5.h,
            backgroundColor: iconBgColor ?? kSecondaryColor.withOpacity(0.3),
            child: icon,
          ),
          SizedBox(
            width: 4.w,
          ),
          SmallText(
            text: text,
            size: 14,
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.black26,
            size: 20,
          )
        ]),
      ),
    );
  }
}
