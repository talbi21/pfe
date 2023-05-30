class User {
  final String userName;
  final String email;
  final String password;
  final String phoneNumber;
  final String image;
  final bool firstConnect;
  final String id;
  final String phonePassword;
  final String dateJoined; // New field

  User({
    required this.firstConnect,
    required this.id,
    required this.userName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.image,
    required this.phonePassword,
    required this.dateJoined, // New field
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
        phonePassword: json['phonePassword'],
        dateJoined: json['createdAt'] // New field
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
      'phonePassword': phonePassword,
      'createdAt': dateJoined // New field
    };
  }
}
