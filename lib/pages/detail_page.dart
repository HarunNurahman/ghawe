import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghawe/models/jobs_model.dart';
import 'package:ghawe/pages/widgets/custom_button.dart';
import 'package:ghawe/pages/widgets/job_info_item.dart';
import 'package:ghawe/shared/style.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  final JobsModel jobsModel;

  const DetailPage(this.jobsModel, {Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late bool isSaved = false;

  // app bar widget
  PreferredSizeWidget _appbar() {
    return AppBar(
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: kPrimaryColor,
        ),
      ),
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
        IconButton(
          onPressed: () {
            setState(() {
              isSaved = !isSaved;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kWhiteColor,
                  content: isSaved
                      ? Text(
                          'Pekerjaan Telah Disimpan',
                          style: primaryTextStyle,
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          'Pekerjaan Batal Disimpan',
                          style: primaryTextStyle.copyWith(
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
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
          // company logo
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  '${widget.jobsModel.imgUrl}',
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // job title
          Text(
            widget.jobsModel.jobTitle!,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          // company
          Text(
            widget.jobsModel.company!,
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
              // salary
              JobInfoItem(
                iconUrl: Icons.attach_money_outlined,
                title: NumberFormat.currency(
                  locale: 'id',
                  symbol: 'IDR ',
                  decimalDigits: 0,
                ).format(widget.jobsModel.salary),
              ),
              // job type
              JobInfoItem(
                iconUrl: Icons.access_time,
                title: widget.jobsModel.jobType!,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              // experience
              JobInfoItem(
                iconUrl: Icons.work,
                title: widget.jobsModel.experience!,
              ),
              // location
              JobInfoItem(
                iconUrl: Icons.location_on,
                title: widget.jobsModel.location!,
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
              '''${widget.jobsModel.jobDesc}''',
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
              '''${widget.jobsModel.jobRequirement}''',
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
