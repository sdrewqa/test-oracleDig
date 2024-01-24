import 'dart:convert';
import 'package:app/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import '../../models/user_response_model.dart';

class UserDataSource {
  Future<UserResponseModel> fetchUser(int userId) async {
    final response = await http.get(Uri.parse(
        '${AppConstants.baseUrl}${AppConstants.users} id')); //поменяй url

    if (response.statusCode == 200) {
      final UserResponseModel userResponse = UserResponseModel.fromJson(
          jsonDecode(response.body)); // не уверен нужно ли

      return userResponse;
    } else {
      throw Exception('Failed to load User from the internet');
    }
  }
}
