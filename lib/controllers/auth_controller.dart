import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:keymait_app/models/appUser.dart';
import 'package:keymait_app/screens/auth_screens/auth_screen.dart';
import 'package:keymait_app/screens/home_screen.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  final FacebookAuth fbAuth = FacebookAuth.instance;
  final userRef = FirebaseFirestore.instance.collection('users');
  final googleSignin = GoogleSignIn();
  bool isHost = false;

  AppUser? user;

  Future<void> signUp(
      String name, String email, String number, String password) async {
    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .catchError((err) {
      throw err;
    });
    await auth.currentUser!.updateDisplayName(name).then((value) {
      if (auth.currentUser != null) {
        user = AppUser.fromFirebase(auth.currentUser!);
      }
    });
    saveUserdata(user!).then((value) => Get.offAll(() => HomeScreen()));
  }

  Future<void> signIn(String email, String password) async {
    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .catchError((err) {
      throw err;
    });
    user = AppUser.fromFirebase(auth.currentUser!);
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? userCred = await googleSignin.signIn();
    if (userCred != null) {
      final googleAuth = await userCred.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await auth.signInWithCredential(credential);
      user = AppUser.fromFirebase(auth.currentUser!);
      saveUserdata(user!).then((value) => Get.offAll(() => HomeScreen()));
      ;
    }
  }

  Future<void> signInWithFb() async {
    final userCred = await fbAuth.login();
    if (userCred.accessToken != null) {
      final authCredential =
          FacebookAuthProvider.credential(userCred.accessToken!.token);
      await auth.signInWithCredential(authCredential);

      final fbData = await FacebookAuth.i.getUserData();
      final userData = auth.currentUser;
      await userData!
          .updatePhotoURL(fbData['picture']['data']['url'])
          .then((value) {
        user = AppUser.fromFirebase(auth.currentUser!);
        saveUserdata(user!)
            .then((value) => Get.offAll(() => const HomeScreen()));
      });
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
    await googleSignin.signOut();
    await fbAuth.logOut();

    Get.offAll(() => const AuthScreen(),
        transition: Transition.zoom,
        duration: const Duration(microseconds: 1000));
  }

  void toggleUser() {
    isHost = !isHost;
    update();
  }

  Future<void> saveUserdata(AppUser user) async {
    print('save data');
    final response = await userRef.where('id', isEqualTo: user.id).get();
    if (response.docs.isEmpty) {
      userRef.doc(user.id).set({
        'id': user.id,
        'email': user.email,
        'name': user.name,
        'imageUrl': user.image,
        'phoneNumber': user.phoneNumer
      });
    }
  }

  @override
  void onInit() {
    if (auth.currentUser != null) {
      user = AppUser.fromFirebase(auth.currentUser!);
    }
    // TODO: implement onInit
    super.onInit();
  }
}
