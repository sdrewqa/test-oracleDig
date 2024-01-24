import 'package:app/features/discover/domain/entities/photos_response.dart';

class UserPhotosResponseModel extends UserPhotosResponseEntity {
  UserPhotosResponseModel(
      {required super.albumId,
      required super.id,
      required super.title,
      required super.url,
      required super.thumbnailUrl});

  factory UserPhotosResponseModel.fromJson(Map<String, dynamic> json) {
    return UserPhotosResponseModel(
      albumId: json['albumId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      url: json['url'] ?? '',
      thumbnailUrl: json['thumbnailUrl'] ?? '',
    );
  }
}

class PhotosListResponseModel {
  final List<UserPhotosResponseModel> entities;

  PhotosListResponseModel({required this.entities});
  factory PhotosListResponseModel.fromJson(List<dynamic> jsonList) {
    List<UserPhotosResponseModel> entities =
        jsonList.map((json) => UserPhotosResponseModel.fromJson(json)).toList();
    return PhotosListResponseModel(entities: entities);
  }
}
