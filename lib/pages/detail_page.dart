import 'package:flutter/material.dart';
import 'package:ghawe/pages/widgets/custom_button.dart';
import 'package:ghawe/pages/widgets/job_info_item.dart';
import 'package:ghawe/shared/style.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late bool isSaved = false;

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
          child: IconButton(
            onPressed: () {
              setState(() {
                isSaved = !isSaved;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: kWhiteColor,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(defaultRadius + 20),
                    ),
                    content: isSaved
                        ? Text(
                            'Pekerjaan Telah Disimpan',
                            style: primaryTextStyle,
                          )
                        : Text(
                            'Pekerjaan Batal Disimpan',
                            style: primaryTextStyle.copyWith(
                              color: Colors.red,
                            ),
                          ),
                    duration: Duration(seconds: 2),
                  ),
                );
              });
            },
            icon: isSaved
                ? Icon(
                    Icons.bookmark,
                    color: kPrimaryColor,
                  )
                : Icon(
                    Icons.bookmark_border,
                    color: kPrimaryColor,
                  ),
          ),
        )
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
  Widget _body(BuildContext context) {
    // job info item widget
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
                title: 'Jakarta Selatan',
              ),
            ],
          ),
        ],
      );
    }

    // description widget
    Widget _description() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deskripsi Pekerjaan',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 8, bottom: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: kGrayColor,
              borderRadius: BorderRadius.circular(defaultRadius + 5),
            ),
            child: Text(
              'as a Mobile Developer, you will create quality code that easy to test and maintain for our mobile application. Your code will be used by millions of our customers.',
              textAlign: TextAlign.justify,
              style: blackTextStyle.copyWith(
                fontSize: 11,
                fontWeight: light,
              ),
            ),
          ),
        ],
      );
    }

    // requirement widget
    Widget _requirement(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Persyaratan',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 8, bottom: defaultMargin),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: kGrayColor,
              borderRadius: BorderRadius.circular(defaultRadius + 5),
            ),
            child: Text(
              '''Min. 2 year of experience in web application development using Flutter. Additional expertises need / Kebutuhan keahlian khusus:\n 
1. Strong understanding in Dart programming language. 
2. Strong understanding in State Management (BLoC). 
3. Good understanding in working with local database (SQLite). Experience in Moor is a great plus. 
4. Good understanding in API invoke. Experience in Dio is a great plus. 
5. Good understanding about Clean Architecture. 
6. Basic understanding in Agile and Scrum. 
7. Self-motivated, can-do attitude and good communication skill.''',
              style: blackTextStyle.copyWith(
                fontSize: 11,
                fontWeight: light,
              ),
            ),
          ),
        ],
      );
    }

    // submit button widget
    Widget _submitButton() {
      return CustomButton(
        title: 'Lamar',
        onPressed: () {},
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _jobInfo(),
        SizedBox(height: defaultMargin),
        _description(),
        _requirement(context),
        _submitButton()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              SizedBox(height: defaultMargin),
              _body(context),
            ],
          ),
        ),
      ),
    );
  }
}
