import 'dart:convert';
import 'package:hermanos/models/user_model.dart';
import 'package:http/http.dart' as http;

class Authentication {
  Future<dynamic> createUser({
    required String email,
    required String username,
    required String firstname,
    required String lastname,
    required String password,
    required String city,
    required String street,
    required String number,
    required String zipcode,
    required String lat,
    required String long,
    required int phonenumber,
  }) async {
    dynamic res;
    try {
      //
      final response = await http.post(
        Uri.parse('https://fakestoreapi.com/users'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: UserModel(
          email: email,
          username: username,
          password: password,
          fullname: {
            'firstname': firstname,
            'lastname': lastname,
          },
          address: {
            city: city,
            street: street,
            number: number,
            zipcode: zipcode,
            'geolocation': {
              'lat': '-37.3159',
              'long': '81.1496',
            },
          },
          phonenumber: phonenumber,
        ).toJson(),
      );
      res = json.decode(response.body);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
    return res;
  }

  Future<dynamic> loginUser({
    required String username,
    required String password,
  }) async {
    dynamic res;
    try {
      final data = "{'username': $username,'password': $password}";
      //
      final response = await http.post(
        Uri.parse('https://fakestoreapi.com/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );
      res = json.decode(response.body);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
    return res;
  }
}
