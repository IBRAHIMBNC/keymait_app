import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/smallText.dart';

class CustomTextField extends StatefulWidget {
  final String hintext;
  final Color? bgColor;
  final String? title;
  final Color? iconColor;
  final IconData prefexIcon;
  final IconData? suffexIcon;
  final bool isPassword;
  final double? borderRadius;
  final bool isPhone;
  final String? Function(String?)? validator;
  final Function(String val)? onSave;

  const CustomTextField({
    Key? key,
    required this.hintext,
    this.title,
    required this.prefexIcon,
    this.isPassword = false,
    this.onSave,
    this.validator,
    this.isPhone = false,
    this.bgColor,
    this.iconColor,
    this.suffexIcon,
    this.borderRadius,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isVisible;

  @override
  void initState() {
    isVisible = widget.isPassword;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          SmallText(
            text: widget.title!,
            size: 11,
            color: Colors.black38,
          ),
        const SizedBox(
          height: 3,
        ),
        Container(
          width: 90.w,
          // height: 6.5.h,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 15),
            color: widget.bgColor ?? Colors.grey.withOpacity(0.15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(
                  widget.prefexIcon,
                  color: widget.iconColor ?? Colors.black45,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Expanded(
                  child: TextFormField(
                    obscuringCharacter: '●',
                    onChanged: widget.onSave,
                    validator: widget.validator,
                    obscureText: isVisible,
                    keyboardType: widget.isPhone ? TextInputType.number : null,
                    decoration: InputDecoration(

                        // contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                        hintText: widget.hintext,
                        hintStyle: TextStyle(color: Colors.black26)),
                  ),
                ),
                if (widget.suffexIcon != null)
                  Icon(
                    widget.suffexIcon,
                    color: widget.iconColor,
                  ),
                if (widget.isPassword)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: Icon(
                      isVisible ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black45,
                    ),
                  )
              ],
            ),
          ),
        ),
        SizedBox(height: 1.2.h)
      ],
    );
  }
}
