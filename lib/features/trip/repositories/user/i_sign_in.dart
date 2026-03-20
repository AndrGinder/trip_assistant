import 'package:trip_assistant/utils/constants/models.dart';

abstract class ISignIn {
  Future<User> signIn({
    required String email,
    required String password,
  });
}