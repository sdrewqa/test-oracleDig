import 'package:app/features/profile/domain/repositories/i_profile_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileRepository with IProfileRepository {
  @override
  User? getCurrentUser() {
    super.getCurrentUser();
    return FirebaseAuth.instance.currentUser;
  }
  
}
