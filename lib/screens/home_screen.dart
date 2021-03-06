import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:keymait_app/constants.dart';
import 'package:keymait_app/controllers/auth_controller.dart';
import 'package:keymait_app/screens/booking_screen.dart';
import 'package:keymait_app/screens/chat_screen.dart';
import 'package:keymait_app/screens/explorer_screen.dart';
import 'package:keymait_app/screens/profile_screen/profile_screen.dart';
import 'package:keymait_app/screens/travel_screen.dart';
import 'package:sizer/sizer.dart';
import '../curvedNavigationBar/naviBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double width = 10;
  int currentInd = 2;
  List<Widget> screens = [
    const ExplorerScreen(),
    const BookingScreen(),
    const TravelSceen(),
    const ChatScreen(),
    ProfileScreen()
  ];
  List<String> itemsNames = ['Explorer', 'Booking', 'Tavel', 'Chat', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: GetBuilder<AuthController>(builder: (authCont) {
        Color activeIconColor =
            authCont.isHost ? kSecondaryColor : kPrimaryColor;
        return CurvedNaviBar(
            animationDuration: const Duration(milliseconds: 400),
            text: const ['Explorer', 'Booking', 'Tavel', 'Chat', 'Profile'],
            index: currentInd,
            height: 9.h,
            buttonBackgroundColor: Colors.white,
            color: authCont.isHost ? kPrimaryColor : kSecondaryColor,
            items: [
              SvgPicture.asset(
                'assets/icons/explorer.svg',
                width: 25,
                color: currentInd == 0 ? activeIconColor : Colors.white,
              ),
              SvgPicture.asset(
                'assets/icons/booking-pending.svg',
                width: 25,
                color: currentInd == 1 ? activeIconColor : Colors.white,
              ),
              SvgPicture.asset(
                'assets/icons/Icon ionic-ios-search.svg',
                width: 25,
                color: currentInd == 2 ? activeIconColor : Colors.white,
              ),
              SvgPicture.asset(
                'assets/icons/chat-bubble.svg',
                width: 25,
                color: currentInd == 3 ? activeIconColor : Colors.white,
              ),
              SvgPicture.asset(
                'assets/icons/Icon awesome-user-alt-1.svg',
                width: 25,
                color: currentInd == 4 ? activeIconColor : Colors.white,
              ),
            ],
            backgroundColor: Colors.transparent,
            onTap: (val) {
              setState(() {
                currentInd = val;
              });
            });
      }),
      body: screens[currentInd],
    );
  }
}
