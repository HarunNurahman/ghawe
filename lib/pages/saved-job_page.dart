import 'package:flutter/material.dart';
import 'package:ghawe/shared/style.dart';

class SavedJobPage extends StatelessWidget {
  const SavedJobPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget _appBar() {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kWhiteColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Pekerjaan Tersimpan',
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
          'Saved Job Page',
          style: blackTextStyle,
        ),
      ),
    );
  }
}
