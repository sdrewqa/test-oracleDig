import 'package:app/features/discover/data/repositories/album_photo_repository.dart';
import 'package:app/features/discover/domain/entities/photos_response.dart';
import 'package:app/features/discover/ui(view)/widgets/discover_overlay_image_widget.dart';
import 'package:flutter/material.dart';

class DiscoverProvider extends ChangeNotifier {
  final AlbumPhotoRepository _albumPhotoRepository = AlbumPhotoRepository();
  var _photos = [];

  get photos => _photos;
  var leftImages = [];
  var rightImages = [];
  int start = 0;
  Future<List<UserPhotosResponseEntity>> fetchPhotos(
      int albumId, int limit, int start) async {
    notifyListeners();
    try {
      _photos =
          await _albumPhotoRepository.fetchAlbumsPhotos(albumId, limit, start);
      var midIndex = (_photos.length / 2).ceil();

      leftImages = _photos.sublist(0, midIndex);
      rightImages = _photos.sublist(midIndex);
      notifyListeners();
      return _photos as List<UserPhotosResponseEntity>;
    } catch (e) {
      // print('Error fetching photos: $e');
      throw (e);
    }
  }
  // Чтобы получить данные пользователя с jsonePlaceHolder который создал фото, нужно получить фотки(там albumId),
  // потом альбом по albumId(там userId) и по userId найти User(имя и Email).
  // Даже так имя и email все равно будет одно и тоже так как друзья не работают,
  // и я просто взял у одного user фотографии в альбоме, и у пользователей там нет avatar

  final List<List<int>> patterns = [
    [220, 310, 220, 310, 310],
    [310, 310, 220, 310, 220],
  ];
  Future<List<UserPhotosResponseEntity>> addNewPhtosToBrowse(
    int albumId,
    int limit,
    int start,
  ) async {
    try {
      var newPhotos =
          await _albumPhotoRepository.fetchAlbumsPhotos(albumId, limit, start);
      var midIndex = (newPhotos.length / 2).ceil();
      leftImages.addAll(newPhotos.sublist(0, midIndex));
      rightImages.addAll(newPhotos.sublist(midIndex));
      patterns[0].addAll([220, 310, 220, 310, 310]);
      patterns[1].addAll([310, 310, 220, 310, 220]);
      notifyListeners();
      return newPhotos;
    } catch (e) {
      // print('Error fetching photos: $e');
      rethrow;
    }
  }

  void showFullScreenImage(String imageUrl, context) {
    showGeneralDialog(
      context: context,
      barrierColor: Color.fromARGB(255, 255, 255, 255),
      barrierDismissible: false,
      barrierLabel: 'Dialog',
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, __, ___) {
        return DiscoverOverlayImageWidget(
          imageUrl: imageUrl,
        );
      },
    );
  }
}
