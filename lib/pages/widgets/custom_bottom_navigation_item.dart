import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghawe/cubit/page_cubit.dart';
import 'package:ghawe/shared/style.dart';

class CustomBottomNavItem extends StatelessWidget {
  final int index;
  final String imgUrl;

  const CustomBottomNavItem({
    Key? key,
    required this.index,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Image.asset(
        imgUrl,
        width: 24,
        color: context.watch<PageCubit>().state == index
            ? kPrimaryColor
            : kGray2Color,
      ),
    );
  }
}
