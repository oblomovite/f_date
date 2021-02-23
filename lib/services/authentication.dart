import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:f_date/services/authentication_api.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthenticationService implements AuthenticationApi {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  FirebaseAuth getFirebaseAuth() {
    return _firebaseAuth;
  }

  @override
  Future<String> createUserWithEmailAndPassword(
      {String email, String password}) async {
    UserCredential userCredential;
    try {
      userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
    return userCredential.user.uid;
  }

  @override
  String currentUserId() {
    return _firebaseAuth.currentUser.uid;
  }

  @override
  Future<bool> isEmailVerified() async {
    User user = await _firebaseAuth.currentUser;
    return user.emailVerified;
  }

  @override
  Future<void> sendEmailVerification() async {
    User user = await _firebaseAuth.currentUser;
    user.sendEmailVerification();
  }

  @override
  Future<String> signInWithEmailAndPassword(
      {String email, String password}) async {
    // UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
    //     email: email, password: password);
    // return user.user.uid;

    String uid;
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        //FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      uid = userCredential.user.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      uid = '';
    }
    return uid;
  }

  @override
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  @override
  Future<String> isPhoneVerified() async {
    // TODO: implement isPhoneVerified
    throw UnimplementedError();
  }

  @override
  Future<String> sendPhoneVerification(String phoneNumber) async {
    // try {await _firebaseAuth.verifyPhoneNumber(phoneNumber: phoneNumber )}{}
    // TODO: implement isPhoneVerified
    throw UnimplementedError();
  }

  @override
  Future<String> signInWithEmailLink(String email, String emailLink) async {
    UserCredential userCredential;
    try {
      userCredential = await _firebaseAuth.signInWithEmailLink(
          email: email, emailLink: emailLink);
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
    return userCredential.user.uid;
  }
}

// FirebaseAuth auth = FirebaseAuth.instance;
//
// // Create a credential from a Google Sign-in Request
// GoogleAuthCredential googleAuthCredential = GoogleAuthProvider.credential(accessToken: 'xxxx');
//
// try {
//   // Attempt to sign in the user in with Google
//   await auth.signInWithCredential(googleAuthCredential);
// } on FirebaseAuthException catch (e) {
//   if (e.code == 'account-exists-with-different-credential') {
//     // The account already exists with a different credential
//     String email = e.email;
//     AuthCredential pendingCredential = e.credential;
//
//     // Fetch a list of what sign-in methods exist for the conflicting user
//     List<String> userSignInMethods = await auth.fetchSignInMethodsForEmail(email);
//
//     // If the user has several sign-in methods,
//     // the first method in the list will be the "recommended" method to use.
//     if (userSignInMethods.first == 'password') {
//       // Prompt the user to enter their password
//       String password = '...';
//
//       // Sign the user in to their account with the password
//       UserCredential userCredential = await auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//
//       // Link the pending credential with the existing account
//       await userCredential.user.linkWithCredential(pendingCredential);
//
//       // Success! Go back to your application flow
//       return goToApplication();
//     }
//
//     // Since other providers are now external, you must now sign the user in with another
//     // auth provider, such as Facebook.
//     if (userSignInMethods.first == 'facebook.com') {
//       // Create a new Facebook credential
//       String accessToken = await triggerFacebookAuthentication();
//       FacebookAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(accessToken);
//
//       // Sign the user in with the credential
//       UserCredential userCredential = await auth.signInWithCredential(facebookAuthCredential);
//
//       // Link the pending credential with the existing account
//       await userCredential.user.linkWithCredential(pendingCredential);
//
//       // Success! Go back to your application flow
//       return goToApplication();
//     }
//
//     // Handle other OAuth providers...
//   }
// }
