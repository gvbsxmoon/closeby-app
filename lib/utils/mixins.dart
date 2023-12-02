import 'package:get/get.dart';

mixin FormValidator {
  final RegExp _emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");

  final RegExp _noSpecialChar = RegExp(r'^[a-zA-Z\s]+$');

  String? validateEmail(String? value) {
    if (value != null && value.isEmpty || !_emailRegex.hasMatch(value!)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validateString(String? value, String fieldName) {
    if (value != null && value.isEmpty) {
      return '$fieldName is required';
    }

    if (value != null && value.isNotEmpty && !_noSpecialChar.hasMatch(value)) {
      return '$fieldName is invalid';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value != null && value.isEmpty ||
        value != null && value.isNotEmpty && value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  String? validateMatch(
      String? firstValue, String? secondValue, String fieldName) {
    if (firstValue != secondValue) {
      return '$fieldName do not match';
    }
    return null;
  }
}

mixin StringUtils {
  String capitalize(String value) {
    return "${value[0].toUpperCase()}${value.substring(1)}";
  }
}
