import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tugas_kelompok/data/models/user_model.dart';

class LoginApi {
  final String baseUrl = 'http://127.0.0.1:8000/api/first/';
  final dio = Dio();

  Future<UserModel> getLogin(String email) async {
    try {
      final response = await dio.get('$baseUrl/login/$email', data: email);
      if (response.statusCode == 200) {
        final Map<String, Object?> loginMap = response.data;
        final loginModel = UserModel.fromJson(loginMap);
        return loginModel;
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<void> login(String email, String password) async {
    final body = jsonEncode({
      'email': email,
      'password': password,
    });
    try {
      final response = await dio.post('$baseUrl/login', data: body);
      print(response.statusCode);
      if (response.statusCode != 200) {
        print('Failed to login, status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Falied to login: $e');
    }
  }

  Future<void> signup(UserModel loginData) async {
    try {
      final response = await dio.post('$baseUrl/signup',
          data: jsonEncode(loginData.toJson()));
      if (response.statusCode != 200) {
        throw Exception('Failed to signup');
      }
    } catch (e) {
      throw Exception('Falied to signup: $e');
    }
  }
}
