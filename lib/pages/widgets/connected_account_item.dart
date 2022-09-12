import 'package:flutter/material.dart';
import 'package:ghawe/shared/style.dart';

class ConnectedAccount extends StatelessWidget {
  final String? imgUrl;

  const ConnectedAccount({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      margin: EdgeInsets.only(right: defaultMargin - 12),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(defaultRadius),
        border: Border.all(
          width: 1,
          color: kGray2Color,
        ),
        boxShadow: [
          BoxShadow(
            color: kGray2Color,
            blurRadius: 3,
            offset: const Offset(1, 1),
          )
        ],
      ),
      child: Image.asset(
        imgUrl!,
        width: 24,
      ),
    );
  }
}
