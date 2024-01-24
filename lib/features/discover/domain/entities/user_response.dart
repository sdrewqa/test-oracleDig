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

}
