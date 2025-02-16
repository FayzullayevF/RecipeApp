import 'package:chef_staff/core/client.dart';
import 'package:chef_staff/core/secure_storage.dart';

class AuthRepository{
  AuthRepository({required this.client});
  final ApiClient client;

  Future<bool> login(String login, String password)async{
    var token = await client.login(login, password);
    await SecureStorage.deleteToken();
    await SecureStorage.deleteToken();
    await SecureStorage.saveToken(token);
    await SecureStorage.saveCredentials(login, password);
    return true;
  }
}