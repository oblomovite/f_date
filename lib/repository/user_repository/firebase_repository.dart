import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f_date/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

///

class FirebaseUserRepository extends UserRepository {
  /// Firebase authentication repository
  const FirebaseUserRepository();

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

  @override
  String get signedEmail => FirebaseAuth.instance.currentUser.email ?? "-";

  // @override
  String get uid => FirebaseAuth.instance.currentUser.uid ?? "-";

  // @override
  Future<void> addUser() async {
    try {
      await FirebaseFirestore.instance.collection('users').add({
          'email': FirebaseAuth.instance.currentUser.email
      });
    } on Exception catch (e) {
      print(e);
    }
  }
}
