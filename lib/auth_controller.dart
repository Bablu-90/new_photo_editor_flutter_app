import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_photo_editor_flutter_app/screens/home_screen.dart';
import 'package:new_photo_editor_flutter_app/screens/login_screen.dart';

class AuthController extends GetxController {
  _initialScreen() {
    if (FirebaseAuth.instance.currentUser != null) {
      Future.delayed(Duration(seconds: 3), () {
        Get.offAll(
            () => HomeScreen(email: FirebaseAuth.instance.currentUser!.email!));
      });
    } else {
      Future.delayed(Duration(seconds: 3), () {
        Get.offAll(() => LoginScreen());
      });
    }
  }

  void register(String email, password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar('About User', 'User message',
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            'Account creation failed',
            style: TextStyle(color: Colors.blueGrey),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white54),
          ));
    }
  }

  void login(String email, password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.to(() => HomeScreen(email: email));
    } catch (e) {
      Get.snackbar('About Login', 'Login message',
          backgroundColor: Colors.lightBlueAccent.shade200,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            'Login failed',
            style: TextStyle(color: Colors.blueGrey),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white54),
          ));
    }
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen(email: '');
          } else {
            return LoginScreen();
          }
        });
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  void onInit() {
    _initialScreen();
    super.onInit();
  }
}
