import 'package:flutter/material.dart';
import 'package:ghawe/shared/style.dart';

class MyApplicationPage extends StatelessWidget {
  const MyApplicationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'My Applications Page',
          style: blackTextStyle,
        ),
      ),
    );
  }
}
