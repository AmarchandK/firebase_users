import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

String uniqueEmail = 'user';

class AuthService extends GetxController {
  
  final FirebaseAuth _fb = FirebaseAuth.instance;

  Stream<User?> stream() => _fb.authStateChanges();

  Future<String> signUp(String email, String password) async {
    try {
      await _fb.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      uniqueEmail = email;
      return Future.value('');
    } on FirebaseAuthException catch (ex) {
      return Future.value(ex.message);
    }
  }

  Future<String> signIn(String email, String password) async {
    try {
      await _fb.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      uniqueEmail = email;
      log(uniqueEmail.toString());
      return Future.value('');
    } on FirebaseAuthException catch (ex) {
      return Future.value(ex.message);
    }
  }

  Future<void> signOut(BuildContext context) async {
    await _fb.signOut();
  }
}
