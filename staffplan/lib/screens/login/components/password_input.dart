import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:staffplan/utils/utils_barrel.dart' show LoginStrings;

class LoginPasswordInputField extends StatefulWidget {
  final TextEditingController passwordController;
  const LoginPasswordInputField({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  @override
  State<LoginPasswordInputField> createState() =>
      _LoginPasswordInputFieldState();
}

class _LoginPasswordInputFieldState extends State<LoginPasswordInputField> {
  bool showPassword = false;

  @override
  void initState() {
    showPassword = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.10,
        right: size.width * 0.10,
      ),
      child: TextFormField(
        controller: widget.passwordController,
        obscureText: !showPassword,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: Colors.grey,
        style: TextStyle(
          color: Colors.black.withOpacity(0.5),
          decorationThickness: 0.0,
        ),
        validator: ((value) {
          if (value!.isEmpty) {
            return LoginStrings.passwordEmpty;
          } else if (value.length < 8) {
            return LoginStrings.passwordTooShortMessage;
          } else if (!RegExp(LoginStrings.passwordPattern).hasMatch(value)) {
            return LoginStrings.invalidPasswordMessage;
          } else {
            return null;
          }
        }),
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          suffixIcon: IconButton(
            onPressed: () => setState(() {
              showPassword = !showPassword;
            }),
            icon: Icon(
              showPassword ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey.shade400,
            ),
          ),
          prefixIcon: Icon(
            Icons.password,
            color: Colors.grey.shade400,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              30.0,
            ),
            borderSide: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              30.0,
            ),
            borderSide: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              30.0,
            ),
            borderSide: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
          labelText: LoginStrings.enterPassword,
          labelStyle: GoogleFonts.openSans().copyWith(
            color: Colors.grey.shade600,
          ),
        ),
      ),
    );
  }
}
