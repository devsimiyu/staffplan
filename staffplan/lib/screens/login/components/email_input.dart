import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:staffplan/utils/utils_barrel.dart' show LoginStrings;

class EmailInputField extends StatelessWidget {
  final TextEditingController emailController;
  const EmailInputField({
    super.key,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.10,
        right: size.width * 0.10,
      ),
      child: TextFormField(
        controller: emailController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: Colors.grey,
        style: TextStyle(
          color: Colors.black.withOpacity(0.5),
          decorationThickness: 0.0,
        ),
        validator: ((value) {
          if (value!.isEmpty) {
            return LoginStrings.emailEmpty;
          } else if (!RegExp(
            LoginStrings.emailPattern,
          ).hasMatch(
            value,
          )) {
            return LoginStrings.invalidEmailMessage;
          } else {
            return null;
          }
        }),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          prefixIcon: Icon(
            Icons.email,
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
          labelText: LoginStrings.enterEmail,
          labelStyle: GoogleFonts.openSans().copyWith(
            color: Colors.grey.shade600,
          ),
        ),
      ),
    );
  }
}
