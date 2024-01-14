import 'dart:async';
import 'package:flutter/material.dart';
import '../../discover/data/repositories/album_photo_repository.dart';
import '../../discover/domain/entities/photos_response.dart';

class SearchProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  // repo from discover feature
  final AlbumPhotoRepository _albumPhotoRepository = AlbumPhotoRepository();
  var _photos = [];

  get photos => _photos;

  int startIndex = 0;
  Future<List<UserPhotosResponseEntity>> fetchPhotos(
      int albumId, int limit, int start, bool addNew) async {
    notifyListeners();
    try {
      var newPhotos;
      newPhotos =
          await _albumPhotoRepository.fetchAlbumsPhotos(albumId, limit, start);
      addNew ? _photos.addAll(newPhotos) : _photos = newPhotos;

      notifyListeners();
      return _photos as List<UserPhotosResponseEntity>;
    } catch (e) {
      // print('Error fetching photos: $e');
      throw (e);
    }
  }

  Timer? _debounce;
  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      print(query);
      fetchPhotos(1, 15, 0, false);
      // if (_debounce!.isActive) {
      //   _debounce!.cancel();
      // }
    });
  }
}
