import 'package:flutter/material.dart';
import 'package:ghawe/shared/style.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // custom widget for bottom navigation bar
    Widget _bottomNavBar() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: kWhiteColor,
            boxShadow: [
              BoxShadow(
                color: kBlackColor.withOpacity(0.1),
                offset: const Offset(0, -1),
                blurRadius: 10,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/icons/ic_home.png',
                width: 24,
              ),
              Image.asset(
                'assets/icons/ic_favorite.png',
                width: 24,
              ),
              Image.asset(
                'assets/icons/ic_explore.png',
                width: 24,
              ),
              Image.asset(
                'assets/icons/ic_status.png',
                width: 24,
              ),
              Image.asset(
                'assets/icons/ic_profile.png',
                width: 24,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Stack(
        children: [
          Center(
            child: Text(
              'Dashboard Page',
              style: blackTextStyle,
            ),
          ),
          _bottomNavBar(),
        ],
      ),
    );
  }
}
