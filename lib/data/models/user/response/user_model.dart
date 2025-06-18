import '../../../../domain/entities/users/response/user_entity.dart';

class UsersModel extends UserEntity {
  const UsersModel({
    required super.id,
    required super.lastName,
    required super.firstName,
    required super.email,
    required super.avatar,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      avatar: json['avatar'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'avatar': avatar,
    };
  }
}
