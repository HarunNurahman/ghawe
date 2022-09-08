import 'package:flutter/material.dart';
import 'package:ghawe/shared/style.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Detail Job Page',
          style: blackTextStyle,
        ),
      ),
    );
  }
}
