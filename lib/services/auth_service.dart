import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {

  static const String baseUrl =
      'http://192.168.1.10:8080';

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {

    final response = await http.post(

      Uri.parse('$baseUrl/login'),

      headers: {
        'Content-Type': 'application/json',
      },

      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> register({
    required String username,
    required String email,
    required String password,
  }) async {

    final response = await http.post(

      Uri.parse('$baseUrl/register'),

      headers: {
        'Content-Type': 'application/json',
      },

      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    return jsonDecode(response.body);
  }
}