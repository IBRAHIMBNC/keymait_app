import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constants.dart';
import '../../../widgets/smallText.dart';

class Header extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  const Header({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.arrow_back,
              color: kPrimaryColor,
              size: 35,
            )),
        SizedBox(
          width: 4.w,
        ),
        SmallText(
          textAlign: TextAlign.left,
          size: 16,
          text: title,
          color: Colors.black,
        ),
      ],
    );
  }
}
