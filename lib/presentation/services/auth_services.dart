import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  // Fungsi untuk mendaftarkan pengguna baru
  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('http://localhost:8000/api/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      print('User registered successfully');
    } else {
      final responseData = jsonDecode(response.body);
      print('Error: ${responseData['error'] ?? 'Unknown error'}');
      throw Exception(responseData['error'] ?? 'Unknown error');
    }
  }

  // Fungsi untuk login pengguna
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('http://localhost:8000/api/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print('Login successful: ${responseData}');

      final prefs = await SharedPreferences.getInstance();
      final username = responseData['user']['username'];
      await prefs.setString('username', username);

      // Simpan token di local storage atau shared preferences
      final token = responseData['token'];
      await _saveToken(token);

      return true; // Login berhasil
    } else {
      final responseData = jsonDecode(response.body);
      print('Error: ${responseData['error'] ?? 'Unknown error'}');
      return false; // Login gagal
    }
  }

  // Fungsi untuk menyimpan token ke local storage
  Future<void> _saveToken(String token) async {
    // Gunakan package seperti shared_preferences untuk menyimpan token secara lokal
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  // Fungsi untuk logout
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (token != null) {
      final url = Uri.parse('http://localhost:8000/api/logout');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Menambahkan token di header
        },
      );

      if (response.statusCode == 200) {
        print('Logout successful');
        await prefs.clear(); // Hapus data token dan user dari shared preferences
      } else {
        print('Logout failed');
        throw Exception('Logout failed');
      }
    } else {
      print('No token found');
    }
  }

}
