import 'package:flutter/material.dart';
import 'package:ghawe/shared/style.dart';
import 'package:intl/intl.dart';

class RecommendedJobCard extends StatelessWidget {
  final String? jobTitle;
  final String? company;
  final String? imgUrl;
  final String? location;
  final int? salary;
  final String? experience;
  final String? lastUpdate;

  const RecommendedJobCard({
    Key? key,
    required this.jobTitle,
    required this.company,
    required this.imgUrl,
    required this.location,
    this.salary = 0,
    required this.experience,
    this.lastUpdate = 'Hari Ini',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(defaultMargin - 10),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(defaultRadius + 5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // company logo
              Container(
                width: 36,
                height: 36,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(
                    defaultRadius,
                  ),
                ),
                child: Image.asset(imgUrl!),
              ),
              const SizedBox(width: 8),
              // title (company name, job title)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // job title
                    Text(
                      jobTitle!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: whiteTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    // company
                    Text(
                      company!.toUpperCase(),
                      style: whiteTextStyle.copyWith(
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: defaultMargin - 20),
          // job location
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 16,
                color: kWhiteColor,
              ),
              const SizedBox(width: 4),
              Text(
                location!,
                style: whiteTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: medium,
                ),
              )
            ],
          ),
          const SizedBox(height: 6),
          // salary
          Row(
            children: [
              Icon(
                Icons.attach_money_rounded,
                size: 16,
                color: kWhiteColor,
              ),
              const SizedBox(width: 4),
              Text(
                NumberFormat.currency(
                  locale: 'id_ID',
                  symbol: 'IDR ',
                  decimalDigits: 0,
                ).format(
                  salary,
                ),
                style: whiteTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: medium,
                ),
              )
            ],
          ),
          const SizedBox(height: 6),
          // experience
          Row(
            children: [
              Icon(
                Icons.work,
                size: 16,
                color: kWhiteColor,
              ),
              const SizedBox(width: 4),
              Text(
                experience!,
                style: whiteTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: medium,
                ),
              )
            ],
          ),
          // footer (hiring status, last update)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 10,
                ),
                margin: const EdgeInsets.only(
                  right: 16,
                  top: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    defaultRadius + 10,
                  ),
                  color: kGreenColor,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.assignment_turned_in,
                      size: 12,
                      color: kWhiteColor,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Actively Hiring',
                      style: whiteTextStyle.copyWith(
                        fontSize: 10,
                        fontWeight: medium,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 12,
                    color: kWhiteColor,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    lastUpdate!,
                    style: whiteTextStyle.copyWith(
                      fontSize: 8,
                      fontWeight: light,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
