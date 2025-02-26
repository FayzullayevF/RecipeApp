import 'package:chef_staff/authentication/data/repositories/sign_up_repository.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  SignUpViewModel({required SignUpRepository repo}) : _repo = repo;

  final SignUpRepository _repo;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final userNameContorller = TextEditingController();
  final birthDateController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? _errorMessage;
  bool get hasError => _errorMessage != null;
  String? get errorMessage => _errorMessage;

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  

  set selectedDate(DateTime?  value){
    _selectedDate = value ?? _selectedDate;
    notifyListeners();
  }

  Future<bool> signUp() async {
    try {
      await _repo.signUp(
        firstNameController.text,
        lastNameController.text,
        userNameContorller.text,
        emailController.text,
        phoneNumberController.text,
        birthDateController.text,
        passwordController.text,
      );
    } on Exception catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
    _errorMessage == null;
    notifyListeners();
    return true;
  }
}
