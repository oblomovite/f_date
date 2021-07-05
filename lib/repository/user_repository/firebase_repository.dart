import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f_date/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseUserRepository extends UserRepository {
  /// Firebase authentication repository
  FirebaseUserRepository();

  @override
  Future<bool> authenticate(String username, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }

  @override
  Future<bool> register(String username, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: username, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }

  @override
  Future<void> logOut() => FirebaseAuth.instance.signOut();


  // @override                     //
  // final String? signedEmail = (FirebaseAuth.instance.currentUser != null ? FirebaseAuth.instance.currentUser!.email : "" );


// FirebaseAuth.instance
//   .authStateChanges()
//   .listen((User? user) {
//     if (user == null) {
//       print('User is currently signed out!');
//     } else {
//       print('User is signed in!');
//     }
//   });

// User? user = FirebaseAuth.instance.currentUser;

// if (user!= null && !user.emailVerified) {
//   await user.sendEmailVerification();
// }

  // @override
  // final String uid = FirebaseAuth.instance.currentUser!.uid;

  // @override
  Future<void> addUser() async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .add({'email': FirebaseAuth.instance.currentUser!.email});
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Future<void> authenticationChanges(User? user) {
    // TODO: implement authenticationChanges
    throw UnimplementedError();
  }

  @override
  Future<void> tokenChanges(User? user) {
    // TODO: implement tokenChanges
    throw UnimplementedError();
  }

  @override
  Future<void> userChanges(User? user) {
    // TODO: implement userChanges
    throw UnimplementedError();
  }

}
