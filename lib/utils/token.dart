import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Token {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String?> getToken() async {
    try {
      return await _storage.read(key: 'jwt_token');
    } catch (err) {
      throw Exception('Error reading token: $err');
    }
  }

  Future<void> setToken(String token) async {
    try {
      await _storage.write(key: 'jwt_token', value: token);
    } catch (err) {
      throw Exception('Error writing token: $err');
    }
  }

  Future<void> deleteToken() async {
    try {
      await _storage.delete(key: 'jwt_token');
    } catch (err) {
      throw Exception('Error deleting token: $err');
    }
  }
}
