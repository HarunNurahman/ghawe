import 'package:flutter/material.dart';
import 'package:ghawe/shared/style.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget _appbar() {
      return AppBar(
        backgroundColor: kWhiteColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Detail Pekerjaan',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: defaultMargin),
            child: Icon(
              Icons.bookmark_outline,
              color: kPrimaryColor,
            ),
          ),
        ],
        toolbarHeight: 90,
      );
    }

    // header widget (company logo, job title, company)
    Widget _header() {
      return Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/img_tokopedia.png',
              width: 128,
            ),
            const SizedBox(height: 20),
            Text(
              'Mobile Developer',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Tokopedia',
              style: blackTextStyle,
            )
          ],
        ),
      );
    }

    // main content widget
    Widget _body() {
      // basic jobinfo widget (salary, location, job type, experience)
      Widget _jobInfo() {
        return Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(
                    Icons.attach_money_rounded,
                    color: kPrimaryColor,
                  ),
                  Text(
                    'IDR 3.500.000',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Icon(
                    Icons.attach_money_rounded,
                    color: kPrimaryColor,
                  ),
                  Text(
                    'IDR 3.500.000',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
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
          _jobInfo(),
        ],
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: _appbar(),
      body: SingleChildScrollView(
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
    );
  }
}
