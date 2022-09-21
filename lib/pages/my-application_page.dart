import 'package:flutter/material.dart';
import 'package:ghawe/shared/style.dart';

class MyApplicationPage extends StatelessWidget {
  const MyApplicationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget _appBar() {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kWhiteColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Lamaran Terkirim',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: _appBar(),
      body: Center(
        child: Text(
          'My Applications Page',
          style: blackTextStyle,
        ),
      ),
    );
  }
}
