import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  //SIGN UP METHOD
  Future signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //IS LOGGED IN Checking METHOD
  void isUserLoggedIn() async {
    try {
      if (user != null) {
        Get.to(()=>HomeScreen());
      }else{
       print('Login First');
      }
    } on FirebaseAuthException catch (e) {
      return null;
    }
  }

  //SIGN IN METHOD
  Future signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN OUT METHOD
  Future signOut() async {
    await _auth.signOut();
    print('signout');
  }
}