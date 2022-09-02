import 'package:flutter/material.dart';
import 'package:ghawe/shared/style.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obsecureText;
  final TextEditingController controller;
  final TextInputType inputType;

  const CustomTextFormField({
    Key? key,
    required this.title,
    required this.hintText,
    this.obsecureText = false,
    required this.controller,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          autocorrect: false,
          enableSuggestions: false,
          obscureText: obsecureText,
          keyboardType: inputType,
          cursorColor: kPrimaryColor,
          style: blackTextStyle.copyWith(fontSize: 12),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: light,
              color: kBlackColor.withOpacity(0.5),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: kPrimaryColor,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: kPrimaryColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
