/// Manage user data and authentication tasks
abstract class UserRepository {
  /// Creates the repository for authenticating a user
  const UserRepository();

  /// Email of the signed user
  get signedEmail;

  /// Login with username and password
  Future<bool> authenticate(String username, String password);

  /// Registration with username and password
  Future<bool> register(String username, String password);

  /// Logout
  Future<void> logOut();

}
