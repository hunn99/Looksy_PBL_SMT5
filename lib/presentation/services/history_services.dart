import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HistoryServices {
  static Future<List<Map<String, dynamic>>> getHistory() async {
    try {

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      if (token == null) {
        throw Exception('Token not found, please login again');
      }

      // Kirim permintaan ke API
      final url = Uri.parse('http://localhost:8000/api/history');
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Sertakan token
        },
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'];
        return List<Map<String, dynamic>>.from(data);
      } else {
        throw Exception('Failed to load history');
      }
    } catch (error) {
      throw Exception('Error fetching history: $error');
    }
  }

  static Future<void> cancelOrder(String orderId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      if (token == null) {
        throw Exception('Token not found, please login again');
      }

      final url = Uri.parse('http://localhost:8000/api/history/cancel/${orderId.toString()}');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Sertakan token
        },
      );

      if (response.statusCode != 200) {
        final message = json.decode(response.body)['message'] ?? 'Failed to cancel order';
        throw Exception(message);
      }
    } catch (error) {
      throw Exception('Error fetching history: $error');
    }
  }

}
