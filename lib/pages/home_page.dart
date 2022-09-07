import 'package:flutter/material.dart';
import 'package:ghawe/shared/style.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

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

    Widget _body() {
      // greeting message widget
      Widget _greeting() {
        return Text(
          '${greeting()}, Pengguna',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        );
      }

      // search bar widget
      Widget _searchBar() {
        return Row(
          children: [
            Container(
              width: 250,
              height: 50,
              child: TextFormField(
                controller: _searchController,
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                  decoration: TextDecoration.none,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: kGray2Color,
                  ),
                  prefixIconColor: kGrayColor,
                  isDense: true,
                  hintText: 'Cari Pekerjaan atau Posisi',
                  hintStyle: gray2TextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                ),
              ),
            ),
          ],
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _greeting(),
          const SizedBox(height: 5),
          _searchBar(),
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
