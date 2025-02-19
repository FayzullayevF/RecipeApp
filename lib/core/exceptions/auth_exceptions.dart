import 'package:flutter/material.dart';

class AuthException implements Exception{
  AuthException({required this.message});
  final String message;

  @override
  String toString() {
    return message;
  }
}