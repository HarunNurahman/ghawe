import 'package:flutter/material.dart';
import 'package:ghawe/shared/style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Profile Page',
          style: blackTextStyle,
        ),
      ),
    );
  }
}
