import 'package:app/features/profile/data/repositories/profile_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../discover/data/models/photos_response.dart';
import '../../discover/data/repositories/album_photo_repository.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileRepository _profileRepository = ProfileRepository();
  User? _currentUser;
  User? get currentUser => _currentUser;

  Future<User?> getProfile() async {
    try {
      _currentUser = _profileRepository.getCurrentUser();
      notifyListeners();

      return _currentUser;
    } catch (e) {
      rethrow;
    }
  }

  // repo from discover data
  final AlbumPhotoRepositoryImpl _albumPhotoRepository =
      AlbumPhotoRepositoryImpl();

  var _photos = [];
  List leftImages = [];
  List rightImages = [];
  get photos => _photos;
  int start = 0;
  Future<List<UserPhotosResponseModel>> fetchPhotos(
      int albumId, int limit, int start, bool addNew) async {
    try {
      var newPhotos;

      newPhotos =
          await _albumPhotoRepository.fetchAlbumsPhotos(albumId, limit, start);
      if (addNew) {
        var midIndex = (newPhotos.length / 2).ceil();
        leftImages.addAll(newPhotos.sublist(0, midIndex));
        rightImages.addAll(newPhotos.sublist(midIndex));
      }
      addNew ? _photos.addAll(newPhotos) : _photos = newPhotos;
      if (!addNew) {
        var midIndex = (_photos.length / 2).ceil();
        leftImages = _photos.sublist(0, midIndex);
        rightImages = _photos.sublist(midIndex);
      }
      notifyListeners();
      return _photos as List<UserPhotosResponseModel>;
    } catch (e) {
      throw (e);
    }
  }

  Never DS() {
    throw ('dsa');
  }
}
