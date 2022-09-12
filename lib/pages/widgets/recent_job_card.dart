import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghawe/shared/style.dart';

class RecentJobCard extends StatefulWidget {
  final String? jobtitle;
  final String? company;
  final String? location;
  final String? imgUrl;

  const RecentJobCard({
    Key? key,
    required this.jobtitle,
    required this.company,
    required this.location,
    required this.imgUrl,
  }) : super(key: key);

  @override
  State<RecentJobCard> createState() => _RecentJobCardState();
}

class _RecentJobCardState extends State<RecentJobCard> {
  late bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed('/detail-job'),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: kGrayColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Row(
          children: [
            // company logo
            Container(
              width: 48,
              height: 48,
              margin: const EdgeInsets.only(right: 6),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
              ),
              child: Image.asset(widget.imgUrl!),
            ),
            // content (job title, company, location)
            Expanded(
              // job title
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.jobtitle!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                    ),
                  ),
                  // company
                  Text(
                    widget.company!,
                    style: blackTextStyle.copyWith(
                      fontSize: 10,
                    ),
                  ),
                  // location
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 14,
                        color: kPrimaryColor,
                      ),
                      Text(
                        widget.location!,
                        style: blackTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              splashRadius: 0.1,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
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
        ),
      ),
    );
  }
}
