import 'package:flutter/material.dart';
import 'package:ghawe/shared/style.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Function() onPressed;
  final Color color;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.color = const Color(0xFF14A800),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius + 20),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title!.toUpperCase(),
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}
