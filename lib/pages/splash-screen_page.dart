import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghawe/shared/style.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Get.offAllNamed('/on-boarding'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Image.asset(
          'assets/images/app_logo_white.png',
          width: 240,
        ),
      ),
    );
  }
}
