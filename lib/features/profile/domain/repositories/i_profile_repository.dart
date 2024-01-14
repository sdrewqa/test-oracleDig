import 'package:firebase_auth/firebase_auth.dart';

abstract class IProfileRepository {
  /// Send email with activation code for user
  User? getCurrentUser();
}
