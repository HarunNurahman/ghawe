import 'package:flutter/material.dart';
import 'package:ghawe/shared/style.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultRadius + 20),
        color: kPrimaryColor,
      ),
      child: Center(
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            title.toUpperCase(),
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ),
      ),
    );
  }
}
