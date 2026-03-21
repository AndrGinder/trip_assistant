import 'package:trip_assistant/features/user/repositories/signIn/i_sign_in.dart';
import 'package:trip_assistant/utils/constants/models.dart';

class SignIn implements ISignIn {
  @override
  Future<User> signIn({
    required String email,
    required String password,
  }) async {
    // Implementation for signing in a user
    // String id = DateTime.now().millisecondsSinceEpoch.toString();    
    return User(
      name: "John Doe", // Replace with actual user name
      email: email,
      passwordHash: password, // Replace with actual password hash
    );
  }
}