import 'package:chef_staff/core/client.dart';
import 'package:chef_staff/core/secure_storage.dart';

class AuthRepository{
  AuthRepository({required this.client});
  final ApiClient client;

  Future<void> login(String login, String password)async{
    var token = await client.login(login, password);
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredentials();
    await SecureStorage.saveToken(token);
    await SecureStorage.saveCredentials(login: login, password: password);
  }
}