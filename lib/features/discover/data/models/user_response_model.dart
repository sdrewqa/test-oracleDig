import 'package:app/features/discover/domain/entities/user_response.dart';

///
class UserResponseModel extends UserResponseEntity {
  final int id;
  final String name;
  final String username;
  final String email;
  final Map address;
  final String phone;
  final String website;
  final Map company;
  UserResponseModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  }) : super(
            id: id,
            name: name,
            username: username,
            email: email,
            address: address,
            phone: phone,
            website: website,
            company:
                company); // Иначе не работает в userRepo использовать как значение которые ожидаешь получить

// Model чтобы добавить fromJson к Entity
  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      UserResponseModel(
          id: json['id'],
          name: json['name'],
          username: json['username'],
          email: json['email'],
          address: json['address'],
          phone: json['phone'],
          website: json['website'],
          company: json['company']);

  Map<String, dynamic> toJson() => {
        "id": email,
        "name": name,
        "username": username,
        "email": email,
        "address": address,
        "phone": phone,
        "website": website,
        "company": company,
      };
}
