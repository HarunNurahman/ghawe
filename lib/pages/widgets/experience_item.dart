import 'package:flutter/material.dart';
import 'package:ghawe/shared/style.dart';

class ExperienceItem extends StatelessWidget {
  final String? imgUrl;
  final String? jobTitle;
  final String? company;
  final int? years;

  const ExperienceItem({
    Key? key,
    required this.imgUrl,
    required this.jobTitle,
    required this.company,
    required this.years,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Image.asset(
            imgUrl!,
            width: 42,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jobTitle!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  company!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${years!} Year(s)',
            style: blackTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
