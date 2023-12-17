import 'dart:convert';


class UserModel {
  String email;
  String username;
  String password;
  Map<String, String> fullname;
  Map<String, dynamic> address;
  int phonenumber;
  UserModel({
    required this.email,
    required this.username,
    required this.password,
    required this.fullname,
    required this.address,
    required this.phonenumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'password': password,
      'fullname': fullname,
      'address': address,
      'phonenumber': phonenumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      fullname: Map<String, String>.from(map['fullname']),
      address: Map<String, dynamic>.from(map['address']),
      phonenumber: map['phonenumber']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

}
