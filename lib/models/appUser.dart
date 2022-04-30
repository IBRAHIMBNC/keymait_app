import 'package:firebase_auth/firebase_auth.dart';

class AppUser {
  final String id;
  final String name;
  final String? image;
  final String? email;
  final String? phoneNumer;

  AppUser({
    required this.name,
    required this.image,
    this.email,
    this.phoneNumer,
    required this.id,
  });

  factory AppUser.fromFirebase(User user) {
    return AppUser(
        id: user.uid,
        name: user.displayName!,
        email: user.email,
        image: user.photoURL,
        phoneNumer: user.phoneNumber);
  }
}
