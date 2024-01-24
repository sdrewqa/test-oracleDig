import 'dart:convert';
import 'package:app/constants/app_constants.dart';
import 'package:app/features/discover/data/data_sources/remote/user_data_source.dart';
import 'package:app/features/discover/data/models/user_response_model.dart';
import 'package:app/features/discover/domain/entities/user_response.dart';
import 'package:app/features/discover/domain/repositories/i_user_repository.dart';
import 'package:http/http.dart' as http;

class UserRepositoryImpl implements IUserRepository {
  final UserDataSource _api = UserDataSource();
  @override
  Future<UserResponseModel> fetchUser(int userId) async {
    try {
      return _api.fetchUser(userId);
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
