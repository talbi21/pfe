import 'dart:ui';

import 'package:get_storage/get_storage.dart';

class User {
  final String userName;
  final String email;
  final String password;
  final String phoneNumber;
  final String image;
  final bool firstConnect;
  final String id;
  final String phonePassword; // New field

  User({
    required this.firstConnect,
    required this.id,
    required this.userName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.image,
    required this.phonePassword, // New field
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      userName: json['userName'],
      email: json['identifiant'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      image: json['image'],
      firstConnect: json['firstConnect'] ?? false,
      phonePassword: json['phonePassword'], // New field
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userName': userName,
      'identifiant': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'image': image,
      'firstConnect': firstConnect,
      'phonePassword': phonePassword, // New field
    };
  }
}
