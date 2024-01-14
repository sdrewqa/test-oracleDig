import '../entities/album_response.dart';
import '../entities/photos_response.dart';

abstract class IAlbumePhotoRepository {
  // получение конкретного альбома
  Future<UserAlbumResponseEntity> fetchUserAlbum(int albumId);
  // получение альбомов конкретного user
  Future<List<UserAlbumResponseEntity>> fetchUserAlbums(int userId);
  // получение фото конкретного альбома
  Future<List<UserPhotosResponseEntity>> fetchAlbumsPhotos(int albumId, int limit, int start);
}
