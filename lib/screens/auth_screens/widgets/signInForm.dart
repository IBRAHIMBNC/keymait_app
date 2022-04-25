import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constants.dart';
import '../../../controllers/auth_controller.dart';
import '../../../widgets/bigTexT.dart';
import '../../../widgets/smallText.dart';
import 'textFieldContainer.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  String email = '';
  String password = '';
  final authCont = Get.put(AuthController());
  final _key = GlobalKey<FormState>();

  void logIn() {
    if (_key.currentState!.validate()) {
      authCont.signIn(email, password).onError((error, stackTrace) {
        String msg = error.toString();
        if (msg.contains('user-not-found')) {
          msg = 'Could not find any user with this email';
        }
        if (msg.contains('wrong-password')) {
          msg = 'The password you enter is incorrect';
        }
        if (msg.contains('A network error')) {
          msg = 'Please check your internet connection';
        }
        Get.closeAllSnackbars();
        Get.showSnackbar(GetSnackBar(
          duration: Duration(seconds: 4),
          overlayColor: Colors.red,
          backgroundColor: Colors.red,
          title: 'Sign Up failed',
          message: msg,
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _key,
        child: Column(
          children: [
            CustomTextField(
                validator: (val) {
                  if (val!.trim().isEmpty) {
                    return 'Please enter email';
                  } else if (!GetUtils.isEmail(val)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSave: (val) => email = val,
                hintext: 'user@keymait.com',
                icon: Icons.email,
                title: 'Email Address'),
            CustomTextField(
                onSave: (val) => password = val,
                hintext: '●●●●●●●●●',
                icon: Icons.key,
                title: 'Password',
                isPassword: true),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                child: const SmallText(
                  text: 'Forgot password?',
                  size: 10,
                  color: Colors.red,
                ),
                onTap: () {},
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            GestureDetector(
              onTap: logIn,
              child: Container(
                width: 90.w,
                height: 6.5.h,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(children: [
                  const Spacer(),
                  const BigText(
                    text: 'LOG IN',
                    size: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  SizedBox(width: 20.w),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30,
                  ),
                ]),
              ),
            ),
          ],
        ));
  }
}
