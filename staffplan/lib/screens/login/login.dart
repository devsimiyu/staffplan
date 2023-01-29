import 'package:flutter/material.dart';

import 'package:staffplan/screens/screens_barrel.dart' show HomeScreen;
import 'package:staffplan/utils/utils_barrel.dart'
    show StaffPlanTheme, GlobalStrings, LoginStrings;

import 'components/email_input.dart';
import 'components/login_button.dart';
import 'components/password_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: StaffPlanTheme.mainColor,
            size: 35,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Form(
            key: _loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  GlobalStrings.logo,
                  height: size.height * 0.08,
                  width: size.width * 0.9,
                ),
                SizedBox(
                  height: size.height * 0.035,
                ),
                Text(
                  LoginStrings.login,
                  style: StaffPlanTheme.lightTextTheme.headline6,
                ),
                SizedBox(
                  height: size.height * 0.07,
                ),
                EmailInputField(
                  emailController: _emailController,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                LoginPasswordInputField(
                  passwordController: _passwordController,
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                LoginButton(
                  voidCallbackAction: () async {
                    if (_loginFormKey.currentState!.validate()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: size.height * 0.25,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
