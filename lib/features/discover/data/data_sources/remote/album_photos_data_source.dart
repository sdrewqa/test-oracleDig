import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../constants/app_constants.dart';
import '../../models/photos_response.dart';

class AlbumPhotosDataSource {
  Future<List<UserPhotosResponseModel>> fetchAlbumsPhotos(
      int albumId, int limit, int start) async {
    final response = await http.get(Uri.parse(
        '${AppConstants.baseUrl}${AppConstants.photosPath}?_start=$start&_limit=$limit'));
    if (response.statusCode == 200) {
      PhotosListResponseModel yourEntityList =
          PhotosListResponseModel.fromJson(jsonDecode(response.body));

      // Получение списка сущностей
      List<UserPhotosResponseModel> entities = yourEntityList.entities;
      return entities;
    } else {
      throw Exception('Failed to load Photos from the internet');
    }
  }

  @override
  Future<UserPhotosResponseModel> fetchUserAlbum(int albumId) {
    // TODO: implement fetchUserAlbum
    throw UnimplementedError();
  }

  @override
  Future<List<UserPhotosResponseModel>> fetchUserAlbums(int userId) {
    // TODO: implement fetchUserAlbums
    throw UnimplementedError();
  }
}
