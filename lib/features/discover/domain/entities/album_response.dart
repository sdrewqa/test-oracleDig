///
class UserAlbumResponseEntity {
  final int userId;
  final int id;
  final String title;
  UserAlbumResponseEntity({
    required this.userId,
    required this.id,
    required this.title,
  });

  // factory UserAlbumResponseEntity.fromDto(UserAlbumResponseEntity dto) =>
  //     UserAlbumResponseEntity(
  //       userId: dto.userId,
  //       id: dto.id,
  //       title: dto.title,
  //     );
  // UserAlbumResponseEntity toDto() => UserAlbumResponseEntity(
  //       userId: userId,
  //       id: id,
  //       title: title,
  //     );
}
