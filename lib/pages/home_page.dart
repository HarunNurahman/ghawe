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
    // header widget
    Widget _header() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
          // Notification
          Image.asset(
            'assets/icons/ic_notification.png',
            width: 20,
          )
        ],
      );
    }

    // greeting message widget
    Widget _greeting() {
      return Text(
        '${greeting()}, Pengguna',
        style: blackTextStyle.copyWith(
          fontSize: 16,
          fontWeight: semiBold,
        ),
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
            child: Column(
              children: [
                _header(),
                SizedBox(height: defaultMargin - 10),
                _greeting(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
