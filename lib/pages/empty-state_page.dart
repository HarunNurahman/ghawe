import 'package:flutter/material.dart';
import 'package:ghawe/shared/style.dart';

class EmptyStatePage extends StatelessWidget {
  const EmptyStatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/undraw_Page_not_found.png',
                width: 250,
              ),
              const SizedBox(height: 16),
              Text(
                'Halaman Tidak Ditemukan!',
                textAlign: TextAlign.center,
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Aduh! Halaman yang anda cari tidak ada atau tidak dapat diakses',
                textAlign: TextAlign.center,
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
