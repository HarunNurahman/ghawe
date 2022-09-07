import 'package:flutter/material.dart';
import 'package:ghawe/shared/style.dart';

class RecentJobCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
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
            child: Image.asset(imgUrl!),
          ),
          // content (job title, company, location)
          Expanded(
            // job title
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jobtitle!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: semiBold,
                  ),
                ),
                // company
                Text(
                  company!,
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
                      location!,
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
          Icon(
            Icons.bookmark_outline,
            size: 24,
            color: kPrimaryColor,
          )
        ],
      ),
    );
  }
}
