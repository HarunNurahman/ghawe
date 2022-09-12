import 'package:flutter/material.dart';
import 'package:ghawe/pages/widgets/connected_account_item.dart';
import 'package:ghawe/shared/style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // app bar widget
    PreferredSizeWidget _appBar() {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kWhiteColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Profile Saya',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    // header widget (circle avatar, user information (name, phone, email, location, connected account))
    Widget _header() {
      // profile image widget
      Widget _profileImg() {
        return CircleAvatar(
          backgroundColor: kPrimaryColor,
          radius: 72,
          child: CircleAvatar(
            backgroundColor: kWhiteColor,
            radius: 68,
            child: CircleAvatar(
              radius: 64,
              backgroundImage: AssetImage('assets/images/img_profile.png'),
            ),
          ),
        );
      }

      // user information widget (name, skill, phone, location)
      Widget _userInfo() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // name
            Text(
              'Bambang Adhitya',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: 4),
            // skillset
            Text(
              'Flutter Developer',
              style: blackTextStyle.copyWith(
                fontWeight: light,
              ),
            ),
            SizedBox(height: defaultMargin - 10),
            // base location
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  size: 16,
                  color: kPrimaryColor,
                ),
                const SizedBox(width: 6),
                Text(
                  'Kota Bandung, Jawa Barat',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: medium,
                  ),
                )
              ],
            ),
            const SizedBox(height: 6),
            // phone information
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone,
                  size: 16,
                  color: kPrimaryColor,
                ),
                const SizedBox(width: 6),
                Text(
                  '+62 8888 1234 5678',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: medium,
                  ),
                )
              ],
            ),
          ],
        );
      }

      // connected account widget (ex. linkedin, github, etc.)
      Widget _connectedAccount() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConnectedAccount(imgUrl: 'assets/images/img_whatsapp.png'),
            ConnectedAccount(imgUrl: 'assets/images/img_linkedin.png'),
            ConnectedAccount(imgUrl: 'assets/images/img_github.png'),
          ],
        );
      }

      return Center(
        child: Column(
          children: [
            _profileImg(),
            SizedBox(height: defaultMargin),
            _userInfo(),
            SizedBox(height: defaultMargin),
            _connectedAccount(),
          ],
        ),
      );
    }

    // body widget (about me, experience, skill)
    Widget _body() {
      // about me widget
      Widget _aboutMe() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tentang Saya',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: defaultMargin - 14),
              padding: EdgeInsets.all(defaultMargin - 16),
              decoration: BoxDecoration(
                color: kGrayColor,
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
            )
          ],
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _aboutMe(),
        ],
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: _appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
              top: defaultMargin,
              bottom: defaultMargin,
            ),
            child: Column(
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
