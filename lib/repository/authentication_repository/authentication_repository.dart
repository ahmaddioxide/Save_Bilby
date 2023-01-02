


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:save_the_bilby_fund/features/authentications/screens/contachForm/contact_form.dart';
import 'package:save_the_bilby_fund/features/authentications/screens/login/login_screen.dart';
import 'package:save_the_bilby_fund/repository/authentication_repository/exception/login_email_password_failure.dart';
import 'package:save_the_bilby_fund/repository/authentication_repository/exception/signup_email_password_failure.dart';
import 'package:save_the_bilby_fund/utils/Dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/authentications/screens/signup/signup_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();


  //Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;


  //Will be load when app launches this func will be called and set the firebaseUser state
  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  /// If we are setting initial screen from here
  /// then in the main.dart => App() add CircularProgressIndicator()
  _setInitialScreen(User? user)  {

    user != null ?  Get.offAll(() => const Dash()) : Get.offAll(() => const LoginScreen());


  }

  Future<String?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() => const LoginScreen()) : Get.to(() => const SignUpScreen());
    } on FirebaseAuthException catch (e){
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      return ex.message;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }


  Future<String?> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() => const Dash()) : Get.to(() => const LoginScreen());

    } on FirebaseAuthException catch (e) {
      final ex = LogInWithEmailAndPasswordFailure.code(e.code);
      return ex.message;
    } catch (_) {
      const ex = LogInWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }

  Future<void> logout() async => await _auth.signOut();


}