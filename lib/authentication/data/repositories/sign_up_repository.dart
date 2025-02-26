import 'package:chef_staff/core/client.dart';
import 'package:chef_staff/core/secure_storage.dart';

class SignUpRepository {
  SignUpRepository({required this.client});
  final ApiClient client;

  Future<void> signUp(
      String firstName,
      String lastName,
      String username,
      String email,
      String phoneNumber,
      String birthDate,
      String password) async{
        var token = await client.signUp(firstName, lastName, username, email, phoneNumber, birthDate, password);
        await SignUpSecureStorage.deleteToken();
        await SignUpSecureStorage.deleteCredentials();
        await SignUpSecureStorage.saveToken(token);
        await SignUpSecureStorage.saveCredentials(firstName: firstName, lastName: lastName, username: username, email: email, phoneNumber: phoneNumber, birthDate: birthDate, password: password);
      }
}