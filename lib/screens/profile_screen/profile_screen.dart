import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:keymait_app/constants.dart';
import 'package:keymait_app/controllers/auth_controller.dart';
import 'package:keymait_app/screens/profile_screen/widgets/buttonList.dart';
import 'package:keymait_app/widgets/bigTexT.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final AuthController authCont = Get.find();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/Icon awesome-bell.svg',
                    height: 3.5.h,
                  ))
            ],
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: BigText(
              color: Colors.black,
              text: 'My Profile',
              size: 17,
            )),
        body: Container(
          padding: EdgeInsets.only(
            top: 10.h,
          ),
          height: 100.h,
          width: 100.w,
          child: Column(children: [
            Align(
              child: CircleAvatar(
                backgroundColor: kSecondaryColor,
                radius: 5.h,
                backgroundImage: CachedNetworkImageProvider(
                  authCont.user!.image ??
                      'https://www.pngitem.com/pimgs/m/30-307416_profile-icon-png-image-free-download-searchpng-employee.png',
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            BigText(
              text: authCont.user!.name,
              color: Colors.black,
              fontWeight: FontWeight.normal,
              size: 16,
            ),
            SizedBox(
              height: 2.h,
            ),
            GetBuilder<AuthController>(
              builder: (authCont) => ToggleSwitch(
                customWidths: [38.w, 38.w],
                minHeight: 6.h,
                cornerRadius: 25,
                activeBgColors: [
                  [authCont.isHost ? kPrimaryColor : kSecondaryColor],
                  [authCont.isHost ? kPrimaryColor : kSecondaryColor]
                ],
                activeFgColor: Colors.white,
                inactiveBgColor: kSecondaryColor.withOpacity(0.3),
                inactiveFgColor: Colors.black,
                totalSwitches: 2,
                labels: ['Traveler', 'Host Mode'],
                fontSize: 13.sp,
                radiusStyle: true,
                onToggle: (index) {
                  authCont.toggleUser();
                  currentIndex = index!;
                },
                initialLabelIndex: currentIndex,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            ButtonsList()
          ]),
        ));
  }
}
