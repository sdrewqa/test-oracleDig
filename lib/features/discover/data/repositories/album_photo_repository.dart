import 'dart:convert';
import 'package:app/features/discover/data/data_sources/remote/album_photos_data_source.dart';
import 'package:app/features/discover/domain/entities/photos_response.dart';
import 'package:app/features/discover/domain/repositories/i_album_photo_repository.dart';
import 'package:http/http.dart' as http;
import '../../../../constants/app_constants.dart';
import '../../domain/entities/album_response.dart';
import '../models/photos_response.dart';

class AlbumPhotoRepositoryImpl implements IAlbumePhotoRepository {
  //TODO нужно сделать фильтр по дате и брать только сегодняшние фото друзей
  @override
  Future<List<UserPhotosResponseModel>> fetchAlbumsPhotos(
      int albumId, int limit, int start) async {
    final AlbumPhotosDataSource _api = AlbumPhotosDataSource();
    try {
      return _api.fetchAlbumsPhotos(albumId, limit, start);
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
