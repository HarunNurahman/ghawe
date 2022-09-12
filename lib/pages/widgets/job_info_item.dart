import 'package:flutter/material.dart';
import 'package:ghawe/shared/style.dart';

class JobInfoItem extends StatelessWidget {
  final IconData iconUrl;
  final String title;

  const JobInfoItem({
    Key? key,
    required this.iconUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Icon(
            iconUrl,
            size: 18,
            color: kPrimaryColor,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 12,
              ),
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}
