import 'package:flutter/widgets.dart';

enum AuthenticationType { google, phone, email, apple, emailWithPassword }

abstract class AuthenticationApi {
  getFirebaseAuth();
  String currentUserId();
  Future<void> signOut();
  Future<String> signInWithEmailAndPassword(
      {@required String email, String password});
  Future<String> createUserWithEmailAndPassword(
      {@required String email, String password});
  Future<void> sendEmailVerification();
  Future<bool> isEmailVerified();
  Future<String> sendPhoneVerification(String phoneNumber);
  Future<String> isPhoneVerified();
  Future<String> signInWithEmailLink(String email, String emailLink);
}
