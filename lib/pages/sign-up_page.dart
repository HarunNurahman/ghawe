import 'package:flutter/material.dart';
import 'package:ghawe/shared/style.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Sign Up Page',
          style: blackTextStyle,
        ),
      ),
    );
  }
}
