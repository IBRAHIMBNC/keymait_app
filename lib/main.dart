import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:keymait_app/controllers/auth_controller.dart';
import 'package:sizer/sizer.dart';

import 'constants.dart';
import 'screens/auth_screen.dart';
import 'screens/dashBoard_screen.dart/dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  Get.lazyPut(
    () => AuthController(),
    fenix: true,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Sizer(
      builder: (context, orientation, deviceType) => GetBuilder<AuthController>(
        builder: (controller) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              fontFamily: 'avenir',
              primaryColor: kPrimaryColor,
              colorScheme: const ColorScheme.light(secondary: kSecondaryColor)),
          home: StreamBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DashBoard();
              }
              return AuthScreen();
            },
            stream: FirebaseAuth.instance.userChanges(),
          ),
        ),
      ),
    );
  }
}