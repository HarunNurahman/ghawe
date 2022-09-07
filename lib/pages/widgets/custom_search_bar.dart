import 'package:flutter/material.dart';
import 'package:ghawe/shared/style.dart';

class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: TextFormField(
        controller: _searchController,
        style: blackTextStyle.copyWith(
          fontSize: 12,
          decoration: TextDecoration.none,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: kGray2Color,
          ),
          prefixIconColor: kGrayColor,
          isDense: true,
          hintText: 'Cari Pekerjaan atau Posisi',
          hintStyle: gray2TextStyle.copyWith(
            fontSize: 12,
            fontWeight: light,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
            borderSide: BorderSide(color: kPrimaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
            borderSide: BorderSide(color: kPrimaryColor),
          ),
        ),
      ),
    );
  }
}
