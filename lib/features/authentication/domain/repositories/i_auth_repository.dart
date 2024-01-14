import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<User?> signUp(String email, String password, String userName);
  Future<User?> signIn(
    String email,
    String password,
  );
  Future<void> signOut();

}
