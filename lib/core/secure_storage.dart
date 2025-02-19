import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage{
  static const tokenKey = 'accessToken';
  static const loginKey = 'login';
  static const passwordKey = 'password';
  static const _storage = FlutterSecureStorage();

  static Future<void> saveToken(String token) async{
    await _storage.write(key: tokenKey, value: token);
  }
  static Future<void> saveCredentials({required String login, required String password}) async{
    await _storage.write(key: loginKey, value: login);
    await _storage.write(key: passwordKey, value: password);
  }
  static Future<void> getToken() async{
    await _storage.read(key: tokenKey);
  }

  static Future<Map<String, String?>> getCredentials() async{
    var rawCredential = {
       'login': await _storage.read(key: loginKey),
      'password': await _storage.read(key: passwordKey)
    };
    return rawCredential;
  }
  static Future<void> deleteToken() async{
    await _storage.delete(key: tokenKey);
  }
  static Future<void> deleteCredentials() async{
    await _storage.delete(key: loginKey);
    await _storage.delete(key: passwordKey);
  }
}