import 'package:moviee/domain/entities/entities.dart';

class UserModel extends UserEntity {
  final String? email;
  final String id;

  UserModel({required this.email, required this.id})
      : super(email: email, id: id);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'id': id,
    };
  }
}
