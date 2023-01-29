import 'package:flutter/foundation.dart' show immutable;

@immutable
class LoginStrings {
  static const login = "Please login to get started";

  static const submit = "Login";

  static const enterEmail = "Enter email";

  static const emailPattern =
      r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$";

  static const invalidEmailMessage = "Please provide a valid email address";

  static const emailEmpty = "Email cannot be empty";

  static const passwordEmpty = "Password cannot be empty";

  static const enterPassword = "Enter password";

  static const passwordTooShortMessage =
      "Password must have 8 or more characters";

  static const passwordPattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  static const invalidPasswordMessage =
      "Password must contain a number, uppercase & lowercase letters and a special character";

  const LoginStrings._();
}
