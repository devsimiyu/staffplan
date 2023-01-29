import 'package:flutter/material.dart';
import 'package:staffplan/utils/utils_barrel.dart'
    show StaffPlanTheme, LoginStrings;

class LoginButton extends StatelessWidget {
  final VoidCallback voidCallbackAction;
  const LoginButton({
    Key? key,
    required this.voidCallbackAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.75,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          30,
        ),
        child: TextButton(
          onPressed: voidCallbackAction,
          child: Text(
            LoginStrings.submit,
            style: StaffPlanTheme.darkTextTheme.headline6,
          ),
        ),
      ),
    );
  }
}
