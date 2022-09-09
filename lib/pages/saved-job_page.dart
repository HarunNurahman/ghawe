import 'package:flutter/material.dart';
import 'package:ghawe/shared/style.dart';

class SavedJobPage extends StatelessWidget {
  const SavedJobPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Saved Job Page',
          style: blackTextStyle,
        ),
      ),
    );
  }
}
