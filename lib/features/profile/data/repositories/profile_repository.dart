import 'package:app/features/profile/domain/repositories/i_profile_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileRepository implements IProfileRepository {

  @override
  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }
}
