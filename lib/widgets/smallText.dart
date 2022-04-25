import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SmallText extends StatelessWidget {
  final Color color;
  final String text;
  final int size;
  final FontWeight fontWeight;
  const SmallText(
      {Key? key,
      this.color = Colors.black54,
      required this.text,
      this.size = 12,
      this.fontWeight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: size.sp, fontWeight: fontWeight),
    );
  }
}
