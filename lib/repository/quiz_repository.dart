/// Manages loading quizes and uploading results
abstract class QuizRepository {
  /// Creates the repository for authenticating a user
  const QuizRepository();

  /// Loads quizes --- all of them for now...
  Future<List<Quiz> loadQuizes();

}
