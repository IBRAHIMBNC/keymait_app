import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:keymait_app/controllers/auth_controller.dart';
import 'package:keymait_app/screens/profile_screen/screens/provideHosting_screen.dart';
import 'package:keymait_app/screens/profile_screen/widgets/profileButton.dart';
import 'package:keymait_app/widgets/smallText.dart';
import 'package:sizer/sizer.dart';

class ButtonsList extends StatelessWidget {
  final AuthController authCont = Get.find();
  ButtonsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      height: 55.h,
      child: Column(children: [
        ProfileButtonCard(
            icon: SvgPicture.asset('assets/icons/Icon awesome-heart-1.svg'),
            text: 'My Favourites'),
        ProfileButtonCard(
            icon: SvgPicture.asset('assets/icons/Icon awesome-user-edit.svg'),
            text: 'Edit Profile'),
        ProfileButtonCard(
            icon: SvgPicture.asset('assets/icons/Icon material-payment.svg'),
            text: 'Payment methods'),
        ProfileButtonCard(
            onPressed: () {
              Get.to(() => ProvideHostingScreen());
            },
            icon:
                SvgPicture.asset('assets/icons/Icon awesome-hand-holding.svg'),
            text: 'Provide Hosting Service'),
        ProfileButtonCard(
            icon:
                SvgPicture.asset('assets/icons/Icon awesome-hand-holding.svg'),
            text: 'Current Hosting'),
        ProfileButtonCard(
            onPressed: authCont.signOut,
            iconBgColor: Colors.red[100],
            icon: SvgPicture.asset('assets/icons/Path 13867.svg'),
            text: 'Logout'),
      ]),
    );
  }
}
