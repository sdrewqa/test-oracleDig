class UserPhotosResponseEntity {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;
  UserPhotosResponseEntity(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});
  factory UserPhotosResponseEntity.fromJson(Map<String, dynamic> json) {
    return UserPhotosResponseEntity(
      albumId: json['albumId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      url: json['url'] ?? '',
      thumbnailUrl: json['thumbnailUrl'] ?? '',
    );
  }

  // factory UserPhotosResponseEntity.fromDto(UserPhotosResponseEntity dto) =>
  //     UserPhotosResponseEntity(
  //       albumeId: dto.albumeId,
  //       id: dto.id,
  //       title: dto.title,
  //       url: dto.url,
  //       thumbnailUrl: dto.thumbnailUrl,
  //     );
  // UserPhotosResponseEntity toDto() => UserPhotosResponseEntity(
  //       albumeId: albumeId,
  //       id: id,
  //       title: title,
  //       url: url,
  //       thumbnailUrl: thumbnailUrl,
  //     );
}

class PhotosListResponseEntity {
  final List<UserPhotosResponseEntity> entities;

  PhotosListResponseEntity({required this.entities});

  factory PhotosListResponseEntity.fromJson(List<dynamic> jsonList) {
    List<UserPhotosResponseEntity> entities = jsonList
        .map((json) => UserPhotosResponseEntity.fromJson(json))
        .toList();
    return PhotosListResponseEntity(entities: entities);
  }
}
