import 'package:flutter/material.dart';
import 'package:ghawe/shared/style.dart';

class SkillItem extends StatelessWidget {
  final String? imgUrl;
  final String? title;

  const SkillItem({
    Key? key,
    required this.imgUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            margin: const EdgeInsets.only(bottom: 4),
            padding: const EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
              color: kGrayColor,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: Image.asset(imgUrl!),
          ),
          Center(
            child: Text(
              title!,
              style: blackTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
