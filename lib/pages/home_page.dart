import 'package:flutter/material.dart';
import 'package:ghawe/pages/widgets/recommended_job_card.dart';
import 'package:ghawe/shared/style.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // Greeting timer
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
      // greeting message widget
      Widget _greeting() {
        return Expanded(
          child: Column(
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
                maxLines: 2,
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              )
            ],
          ),
        );
      }

      // profile picture widget
      Widget _profilePic() {
        return CircleAvatar(
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
        );
      }

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _greeting(),
          _profilePic(),
        ],
      );
    }

    // body content widget
    Widget _body() {
      // Upcoming event widget
      Widget _upcomingEvent() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Acara Mendatang',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  'Lihat Semua',
                  style: primaryTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: light,
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            // event banner row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: Image.asset(
                      'assets/images/img_event.png',
                      width: 300,
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      }

      // Recommended job widget
      Widget _recommendedJob() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Berdasarkan Minat Anda',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  'Lihat Semua',
                  style: primaryTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: light,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Recommended job banner
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  RecommendedJobCard(
                    jobTitle: 'Mobile Developer',
                    company: 'Gojek',
                    salary: 3000000,
                    imgUrl: 'assets/images/img_gojek.png',
                    location: 'Jakarta Selatan',
                    experience: '1 - 3 Tahun',
                  ),
                  RecommendedJobCard(
                    jobTitle: 'Social Media Marketing',
                    company: 'Tokopedia',
                    imgUrl: 'assets/images/img_tokopedia.png',
                    location: 'Jakarta',
                    experience: '3 Tahun',
                  ),
                  RecommendedJobCard(
                    jobTitle: 'Internship Program',
                    company: 'Alphabet Inc.',
                    imgUrl: 'assets/images/img_google.png',
                    location: 'Tangerang',
                    experience: '< 1 Tahun',
                  )
                ],
              ),
            )
          ],
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _upcomingEvent(),
          SizedBox(height: defaultMargin),
          _recommendedJob()
        ],
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
    );
  }
}
