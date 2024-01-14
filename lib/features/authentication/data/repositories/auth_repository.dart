import 'package:app/features/authentication/domain/repositories/i_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository implements IAuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  @override

  ///Implemented from domain repo
  ///
  Future<User?> signUp(String email, String password, String userName) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Регистрация успешна, теперь можно добавить дополнительные данные, такие как имя.
      await userCredential.user!.updateDisplayName(userName);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception('This email is already in use');
      }
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<User?> signIn(String email, String password) async {
    // try catch in view model
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
