import 'package:flutter/material.dart';
import 'package:ghawe/shared/style.dart';

class EmptyStatePage extends StatelessWidget {
  const EmptyStatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: Image.asset('assets/images/undraw_Empty.png'),
      ),
    );
  }
}
