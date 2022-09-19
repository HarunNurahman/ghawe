import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ghawe/cubit/auth_cubit.dart';
import 'package:ghawe/cubit/page_cubit.dart';
import 'package:ghawe/pages/widgets/connected_account_item.dart';
import 'package:ghawe/pages/widgets/custom_button.dart';
import 'package:ghawe/pages/widgets/experience_item.dart';
import 'package:ghawe/pages/widgets/skill_item.dart';
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
              'Harun Nurahman',
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
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(defaultMargin - 16),
              decoration: BoxDecoration(
                color: kGrayColor,
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur ad ipiscing elit,  sed do eiusmod tempor incididunt ut labore et dolore  magna aliqua.',
                textAlign: TextAlign.justify,
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: light,
                ),
              ),
            ),
          ],
        );
      }

      // my experience widget
      Widget _experience() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pengalaman Saya',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                ExperienceItem(
                  imgUrl: 'assets/images/img_tokopedia.png',
                  jobTitle: 'Full Stack Mobile Developer',
                  company: 'Tokopedia',
                  years: 3,
                ),
                ExperienceItem(
                  imgUrl: 'assets/images/img_gojek.png',
                  jobTitle: 'Front End Mobile Developer',
                  company: 'Gojek',
                  years: 1,
                ),
                ExperienceItem(
                  imgUrl: 'assets/images/img_shopee.png',
                  jobTitle: 'Social Media Marketing (Intern)',
                  company: 'Shopee Indonesia',
                  years: 1,
                ),
                ExperienceItem(
                  imgUrl: 'assets/images/img_google.png',
                  jobTitle: 'UI/UX Designer',
                  company: 'Alphabet Inc.',
                  years: 1,
                ),
              ],
            ),
          ],
        );
      }

      // my skill widget
      Widget _skill() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Keahlian Saya',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SkillItem(
                    imgUrl: 'assets/images/img_flutter.png',
                    title: 'Flutter',
                  ),
                  SkillItem(
                    imgUrl: 'assets/images/img_figma.png',
                    title: 'Figma',
                  ),
                  SkillItem(
                    imgUrl: 'assets/images/img_laravel.png',
                    title: 'Laravel',
                  ),
                  SkillItem(
                    imgUrl: 'assets/images/img_postman.png',
                    title: 'Postman',
                  ),
                ],
              ),
            )
          ],
        );
      }

      // sign out button widget
      Widget _signOut() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.error),
                ),
              );
            } else if (state is AuthInitial) {
              context.read<PageCubit>().setPage(0);
              Get.offAllNamed('/sign-in');
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(color: kPrimaryColor),
              );
            }

            return CustomButton(
              title: 'Sign Out',
              onPressed: () {
                context.read<AuthCubit>().signOut();
              },
            );
          },
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _aboutMe(),
          SizedBox(height: defaultMargin),
          _experience(),
          SizedBox(height: defaultMargin),
          _skill(),
          SizedBox(height: defaultMargin),
          _signOut(),
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
                SizedBox(height: defaultMargin + 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
