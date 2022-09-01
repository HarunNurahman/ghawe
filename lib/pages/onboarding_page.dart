import 'package:flutter/material.dart';
import 'package:ghawe/shared/style.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    final pageDecoration = PageDecoration(
      titleTextStyle: blackTextStyle.copyWith(
        fontSize: 20,
        fontWeight: semiBold,
      ),
      bodyTextStyle: blackTextStyle.copyWith(
        fontSize: 14,
      ),
      contentMargin: EdgeInsets.symmetric(horizontal: defaultMargin),
      footerPadding: EdgeInsets.symmetric(vertical: defaultMargin + 20),
    );

    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: kWhiteColor,
        showBackButton: false,
        showNextButton: true,
        showSkipButton: true,
        showDoneButton: false,
        skipOrBackFlex: 1,
        dotsFlex: 3,
        skip: Text(
          'Skip'.toUpperCase(),
          style: primaryTextStyle.copyWith(
            fontSize: 12,
            fontWeight: semiBold,
          ),
        ),
        next: Text(
          'Next'.toUpperCase(),
          style: whiteTextStyle.copyWith(
            fontSize: 12,
            fontWeight: semiBold,
          ),
        ),
        nextStyle: TextButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              defaultRadius,
            ),
          ),
        ),
        dotsDecorator: DotsDecorator(
          size: const Size.square(8),
          activeSize: const Size(16, 8),
          activeColor: kPrimaryColor,
          color: kGrayColor,
          spacing: const EdgeInsets.symmetric(horizontal: 6),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        controlsMargin: EdgeInsets.only(bottom: defaultMargin),
        controlsPadding: EdgeInsets.symmetric(horizontal: defaultMargin),
        pages: [
          // Onboarding page 1
          PageViewModel(
            title: 'Makin Mudah Mencari\nPekerjaan Impian',
            body:
                'Kembangkan diri dan tingkatkan karir anda, hingga mencapai pekerjaan impian anda',
            decoration: pageDecoration,
            image: Image.asset(
              'assets/images/undraw_career_progress.png',
              width: 300,
            ),
          ),
          // Onboarding page 2
          PageViewModel(
            title: 'Pilih Pekerjaan Sesuai\nSkill & Passion',
            body:
                'Ada banyak pilihan pekerjaan yang bisa anda sesuaikan dengan minat dan skill yang anda miliki',
            decoration: pageDecoration,
            image: Image.asset(
              'assets/images/undraw_online_resume.png',
              width: 300,
            ),
          ),
          // Onboarding page 3
          PageViewModel(
            title: 'Gabung dan Mulai Sekarang',
            body:
                'Raih pekerjaan impian anda sekarang\ndan tingkatkan karir juga penghasilan anda!',
            decoration: pageDecoration,
            image: Image.asset(
              'assets/images/undraw_Interview.png',
              width: 300,
            ),
            footer: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 40,
                      ),
                      backgroundColor: kPrimaryColor,
                      splashFactory: NoSplash.splashFactory,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultRadius),
                      ),
                    ),
                    child: Text(
                      'Masuk',
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 40,
                      ),
                      backgroundColor: kWhiteColor,
                      splashFactory: NoSplash.splashFactory,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultRadius),
                        side: BorderSide(
                          width: 2,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                    child: Text(
                      'Daftar',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
