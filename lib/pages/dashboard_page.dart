import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghawe/cubit/page_cubit.dart';
import 'package:ghawe/models/user_model.dart';
import 'package:ghawe/pages/explore_page.dart';
import 'package:ghawe/pages/home_page.dart';
import 'package:ghawe/pages/my-application_page.dart';
import 'package:ghawe/pages/profile_page.dart';
import 'package:ghawe/pages/saved-job_page.dart';
import 'package:ghawe/pages/widgets/custom_bottom_navigation_item.dart';
import 'package:ghawe/shared/style.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // list page in bottom nav bar
    Widget _buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return SavedJobPage();
        case 2:
          return ExplorePage();
        case 3:
          return MyApplicationPage();
        case 4:
          return ProfilePage();
        default:
          return HomePage();
      }
    }

    // custom widget for bottom navigation bar
    Widget _bottomNavBar() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: kWhiteColor,
            boxShadow: [
              BoxShadow(
                color: kBlackColor.withOpacity(0.1),
                offset: const Offset(0, -1),
                blurRadius: 10,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavItem(
                index: 0,
                imgUrl: 'assets/icons/ic_home.png',
              ),
              CustomBottomNavItem(
                index: 1,
                imgUrl: 'assets/icons/ic_favorite.png',
              ),
              CustomBottomNavItem(
                index: 2,
                imgUrl: 'assets/icons/ic_explore.png',
              ),
              CustomBottomNavItem(
                index: 3,
                imgUrl: 'assets/icons/ic_status.png',
              ),
              CustomBottomNavItem(
                index: 4,
                imgUrl: 'assets/icons/ic_profile.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kWhiteColor,
          body: Stack(
            children: [
              _buildContent(currentIndex),
              _bottomNavBar(),
            ],
          ),
        );
      },
    );
  }
}
