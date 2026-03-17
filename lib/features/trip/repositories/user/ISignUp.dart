abstract class ISignUp {
  Future<String> signUp({
    required String name,
    required String email,
    required String password,
  });
}