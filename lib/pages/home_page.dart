import 'package:flutter/material.dart';
import 'package:ghawe/shared/style.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Selamat Pagi';
    }
    if (hour < 17) {
      return 'Selamat Siang';
    }
    return 'Selamat Malam';
  }

  @override
  Widget build(BuildContext context) {
    // greeting message widget
    Widget _greeting() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${greeting()},',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          // const SizedBox(height: 4),
          Text(
            'Pengguna Baru',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          )
        ],
      );
    }

    // header widget
    Widget _header() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _greeting(),
          // Profile Picture
          CircleAvatar(
            radius: 36,
            backgroundColor: kBlackColor,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: kWhiteColor,
              child: const CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage(
                  'assets/images/img_profile.png',
                ),
              ),
            ),
          ),
        ],
      );
    }

    // body content widget
    Widget _body() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
              top: defaultMargin + 20,
              bottom: defaultMargin,
            ),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _header(),
                  SizedBox(height: defaultMargin),
                  _body(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
