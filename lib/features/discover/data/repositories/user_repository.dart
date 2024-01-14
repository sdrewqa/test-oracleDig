import 'dart:convert';
import 'package:app/constants/app_constants.dart';
import 'package:app/features/discover/data/models/user_response_model.dart';
import 'package:app/features/discover/domain/entities/user_response.dart';
import 'package:app/features/discover/domain/repositories/i_user_repository.dart';
import 'package:http/http.dart' as http;

class UserRepository implements IUserRepository {
  @override
  Future<UserResponseModel> fetchUser(int userId) async {
    try {
      final response = await http
          .get(Uri.parse('${AppConstants.baseUrl}${AppConstants.users} id'));//поменяй url

      if (response.statusCode == 200) {
        final UserResponseModel userResponse = UserResponseModel.fromJson(
            jsonDecode(response.body)); // не уверен нужно ли

        return userResponse;
      } else {
        throw Exception('Failed to load User from the internet');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<UserResponseEntity>> fetchUsers() {
    // TODO: implement fetchUsers
    throw UnimplementedError();
  }
}
