import 'package:flutter/material.dart';
import 'package:ghawe/pages/widgets/job_info_item.dart';
import 'package:ghawe/shared/style.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  PreferredSizeWidget _appbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kWhiteColor,
      centerTitle: true,
      elevation: 0,
      title: Text(
        'Detail Pekerjaan',
        style: blackTextStyle.copyWith(
          fontSize: 18,
          fontWeight: semiBold,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: defaultMargin),
          child: Icon(
            Icons.bookmark_outline,
            color: kPrimaryColor,
            size: 24,
          ),
        ),
      ],
    );
  }

  // header widget (company logo, job title, company name)
  Widget _header() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/img_tokopedia.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Mobile Developer',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          Text(
            'Tokopedia',
            textAlign: TextAlign.center,
            style: blackTextStyle,
          )
        ],
      ),
    );
  }

  // body content widget
  Widget _body() {
    Widget _jobInfo() {
      return Column(
        children: [
          Row(
            children: [
              JobInfoItem(
                iconUrl: Icons.attach_money_outlined,
                title: 'IDR 3.500.000',
              ),
              JobInfoItem(
                iconUrl: Icons.access_time,
                title: 'Full-Time',
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              JobInfoItem(
                iconUrl: Icons.work,
                title: '1 - 3 Tahun',
              ),
              JobInfoItem(
                iconUrl: Icons.location_on,
                title: 'Daerah Istimewa Yogyakarta',
              ),
            ],
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _jobInfo(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: _appbar(),
      body: Padding(
        padding: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: defaultMargin,
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
    );
  }
}
