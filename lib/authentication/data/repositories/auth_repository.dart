import 'package:chef_staff/core/client.dart';
import 'package:chef_staff/core/secure_storage.dart';

class AuthRepository{
  AuthRepository({required this.client});
  final ApiClient client;
  String? jwt;

  Future<void> login(String login, String password)async{
    var token = await client.login(login, password);
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredentials();
    await SecureStorage.saveToken(token);
    await SecureStorage.saveCredentials(login: login, password: password);
  }

  Future<void> logout() async{
    await SecureStorage.deleteCredentials();
    await SecureStorage.deleteToken();
  }

  Future<bool> refreshToken() async{
    var credinteal = await SecureStorage.getCredentials();
    if(credinteal['login'] == null || credinteal['password'] == null){
      return false;
    }else{
      jwt = await client.login(credinteal['login']!, credinteal['password']!);
      await SecureStorage.deleteToken();
      await SecureStorage.saveToken(jwt!);
      return true;
    }
  }
}