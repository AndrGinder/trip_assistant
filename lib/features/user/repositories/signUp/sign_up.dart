import 'package:trip_assistant/features/user/repositories/SignUp/i_sign_up.dart';

class SignUp implements ISignUp {
  @override
  Future<String> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    // Implementation for signing up a user
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    return id;
  }
}