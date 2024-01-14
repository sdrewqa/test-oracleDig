import 'dart:convert';
import 'package:app/features/discover/domain/entities/photos_response.dart';
import 'package:app/features/discover/domain/repositories/i_album_photo_repository.dart';
import 'package:http/http.dart' as http;
import '../../../../constants/app_constants.dart';
import '../../domain/entities/album_response.dart';

class AlbumPhotoRepository implements IAlbumePhotoRepository {
  //TODO нужно сделать фильтр по дате и брать только сегодняшние фото друзей
  @override
  Future<List<UserPhotosResponseEntity>> fetchAlbumsPhotos(
      int albumId, int limit, int start) async {
    try {
      final response = await http.get(Uri.parse(
          '${AppConstants.baseUrl}${AppConstants.photosPath}?_start=$start&_limit=$limit'));
      if (response.statusCode == 200) {
        PhotosListResponseEntity yourEntityList =
            PhotosListResponseEntity.fromJson(jsonDecode(response.body));

        // Получение списка сущностей
        List<UserPhotosResponseEntity> entities = yourEntityList.entities;
        return entities;
      } else {
        throw Exception('Failed to load Photos from the internet');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<UserAlbumResponseEntity> fetchUserAlbum(int albumId) {
    // TODO: implement fetchUserAlbum
    throw UnimplementedError();
  }

  @override
  Future<List<UserAlbumResponseEntity>> fetchUserAlbums(int userId) {
    // TODO: implement fetchUserAlbums
    throw UnimplementedError();
  }
}
