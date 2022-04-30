import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class RoundedIconButton extends StatelessWidget {
  final SvgPicture picture;
  final Function()? func;
  const RoundedIconButton({Key? key, required this.picture, this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
          height: 7.h,
          width: 7.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  spreadRadius: -8,
                  blurRadius: 4,
                  offset: Offset(0, 0),
                  color: Colors.black12),
            ],
          ),
          child: picture),
    );
  }
}
