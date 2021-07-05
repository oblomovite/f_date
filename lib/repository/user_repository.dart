import 'package:firebase_auth/firebase_auth.dart';

/// Manage user data and authentication tasks
abstract class UserRepository {
  /// Creates the repository for authenticating a user
  const UserRepository();

  /// Email of the signed user
  // get signedEmail;

  /// Various subscribing functions to perform side-effects on state changes
  Future<void> userChanges(User? user);
  Future<void> authenticationChanges(User? user);
  Future<void> tokenChanges(User? user);

  /// User Actions --
  Future<bool> authenticate(String username, String password);
  Future<bool> register(String username, String password);
  Future<void> logOut();
}
