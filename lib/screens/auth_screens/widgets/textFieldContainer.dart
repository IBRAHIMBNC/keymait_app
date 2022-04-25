import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/smallText.dart';

class CustomTextField extends StatefulWidget {
  final String hintext;
  final String title;
  final IconData icon;
  final bool isPassword;
  final bool isPhone;
  final String? Function(String?)? validator;
  final Function(String val)? onSave;

  const CustomTextField({
    Key? key,
    required this.hintext,
    required this.title,
    required this.icon,
    this.isPassword = false,
    this.onSave,
    this.validator,
    this.isPhone = false,
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
        SmallText(
          text: widget.title,
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
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.withOpacity(0.15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(
                  widget.icon,
                  color: Colors.black45,
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
