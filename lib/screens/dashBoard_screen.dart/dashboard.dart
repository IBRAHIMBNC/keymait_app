import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authCont = Get.find();
    return Scaffold(
      body: Center(
          child: TextButton(
        child: Text('logout'),
        onPressed: authCont.signOut,
      )),
    );
  }
}
