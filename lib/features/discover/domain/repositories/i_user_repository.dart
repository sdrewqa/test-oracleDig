import 'package:app/features/discover/domain/entities/user_response.dart';

abstract class IUserRepository {
  // получение конкретного user
  Future<UserResponseEntity> fetchUser(int userId);
  // получение users
  Future<List<UserResponseEntity>> fetchUsers();

}
