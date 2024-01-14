///
class UserResponseEntity {
  final int id;
  final String name;
  final String username;
  final String email;
  final Map address;
  final String phone;
  final String website;
  final Map company;
  UserResponseEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });
// Не все данные будут использоватся так что отсеиваем
  // factory UserResponseEntity.fromDto(UserResponseModel dto) =>
  //     UserResponseEntity(
  //         id: dto.id,
  //         name: dto.name,
  //         username: dto.username,
  //         email: dto.email,
  //         address: dto.address,
  //         phone: dto.phone,
  //         website: dto.website,
  //         company: dto.company);
  // UserResponseModel toDto() => UserResponseModel(
  //     id: id,
  //     name: name,
  //     username: username,
  //     email: email,
  //     address: address,
  //     phone: phone,
  //     website: website,
  //     company: company);
}
