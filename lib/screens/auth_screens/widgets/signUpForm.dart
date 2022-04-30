import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keymait_app/screens/auth_screens/screens/continueAs_screen.dart';
import 'package:sizer/sizer.dart';

import '../../../constants.dart';
import '../../../controllers/auth_controller.dart';
import '../../../widgets/bigTexT.dart';
import '../../home_screen.dart';
import 'textFieldContainer.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final AuthController authCont = Get.find();
  final _key = GlobalKey<FormState>();
  String name = '';
  String phone = '';
  String email = '';
  String password = '';

  Future<void> onSignUp() async {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();

      await authCont
          .signUp(
        name,
        email,
        phone,
        password,
      )
          .onError((error, stackTrace) {
        String msg = error.toString();
        if (msg.contains('A network error')) {
          msg = 'Please check your internet connection';
        }
        if (msg.contains('email-already-in-use')) {
          msg = 'The email you entered is already exists';
        }
        Get.closeAllSnackbars();
        Get.showSnackbar(GetSnackBar(
          duration: const Duration(seconds: 4),
          overlayColor: Colors.red,
          backgroundColor: Colors.red,
          title: 'Sign Up failed',
          message: msg,
        ));
      }).then((value) => Get.offAll(() => ContinueAScreen()));
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
                  if (val == null || val.trim().isEmpty) {
                    return 'Please enter your name';
                  }
                },
                onSave: (val) => name = val,
                hintext: 'Full Name',
                prefexIcon: Icons.person,
                title: 'Your Name'),
            CustomTextField(
                isPhone: true,
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Please enter Phone number';
                  } else if (!val.trim().isPhoneNumber) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
                onSave: (val) => phone = val,
                hintext: 'Mobile Number',
                prefexIcon: Icons.phone_iphone,
                title: 'Phone Number'),
            CustomTextField(
                validator: (val) {
                  if (val!.trim().isEmpty) {
                    return 'Email is empty';
                  } else if (!GetUtils.isEmail(val.trim())) {
                    return 'Email is invalid';
                  }
                  return null;
                },
                onSave: (val) => email = val,
                hintext: 'user@keymait.com',
                prefexIcon: Icons.email,
                title: 'Email Address'),
            CustomTextField(
                validator: (val) {
                  if (val!.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
                onSave: (val) => password = val,
                hintext: '●●●●●●●●●',
                prefexIcon: Icons.key,
                title: 'Password',
                isPassword: true),
            SizedBox(
              height: 2.h,
            ),
            GestureDetector(
              onTap: onSignUp,
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
                    text: 'SIGN UP',
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
