import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FacebookAuth fbAuth = FacebookAuth.instance;
  final userRef = FirebaseFirestore.instance.collection('users');
  final googleSignin = GoogleSignIn();
  User? user;
  Future<void> signUp(
      String name, String email, String number, String password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => Get.close(1));
      user = auth.currentUser;
      user!.updateDisplayName(name);
      saveUserdata(auth.currentUser!);
    } catch (err) {
      rethrow;
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Get.close(1));
    } catch (err) {
      rethrow;
    }
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? user = await googleSignin.signIn();
    if (user != null) {
      final googleAuth = await user.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await auth.signInWithCredential(credential).then((value) => Get.close(1));

      saveUserdata(auth.currentUser!);
    }
  }

  Future<void> signInWithFb() async {
    final user = await fbAuth.login();
    if (user.accessToken != null) {
      final authCredential =
          FacebookAuthProvider.credential(user.accessToken!.token);
      await auth
          .signInWithCredential(authCredential)
          .then((value) => Get.close(1));
      final userData = auth.currentUser;
      saveUserdata(userData!);
    }
  }

  void signOut() {
    googleSignin.signOut();
    fbAuth.logOut();
    auth.signOut();
  }

  Future<void> saveUserdata(User user) async {
    final response = await userRef.where('id', isEqualTo: user.uid).get();
    if (response.docs.isEmpty) {
      userRef.doc(user.uid).set({
        'id': user.uid,
        'name': user.displayName,
        'imageUrl': user.photoURL
      });
    }
  }
}
