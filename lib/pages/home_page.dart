import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghawe/cubit/auth_cubit.dart';
import 'package:ghawe/cubit/jobs_cubit.dart';
import 'package:ghawe/models/jobs_model.dart';
import 'package:ghawe/pages/widgets/recent_job_card.dart';
import 'package:ghawe/pages/widgets/recommended_job_card.dart';
import 'package:ghawe/shared/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<JobsCubit>().fetchJob();
    super.initState();
  }

  // Greeting timer
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Selamat Pagi';
    }
    if (hour < 17) {
      return 'Selamat Siang';
    }
    return 'Selamat Malam';
  }

  @override
  Widget build(BuildContext context) {
    // header widget
    Widget _header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // greeting text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${greeting()},',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                      // const SizedBox(height: 4),
                      Text(
                        state.userModel.name!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        ),
                      )
                    ],
                  ),
                ),
                // profile pic,
                CircleAvatar(
                  radius: 36,
                  backgroundColor: kBlackColor,
                  child: CircleAvatar(
                    radius: 34,
                    backgroundColor: kWhiteColor,
                    child: CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage(
                        'assets/images/img_office-worker.png',
                      ),
                      backgroundColor: kWhiteColor,
                    ),
                  ),
                )
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      );
    }

    // body content widget
    Widget _body() {
      // Upcoming event widget
      Widget _upcomingEvent() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Acara Mendatang',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  'Lihat Semua',
                  style: primaryTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: light,
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            // event banner row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: Image.asset(
                      'assets/images/img_event.png',
                      width: 300,
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      }

      // Recommended job widget
      Widget _recommendedJob(List<JobsModel> jobList) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Berdasarkan Minat Anda',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  'Lihat Semua',
                  style: primaryTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: light,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Recommended job banner
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: jobList.map((JobsModel jobsModel) {
                  return RecommendedJobCard(jobsModel);
                }).toList(),
              ),
            )
          ],
        );
      }

      // New job list widget
      Widget _recentPostedJob(List<JobsModel> jobsList) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Lowongan Terbaru',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  'Lihat Semua',
                  style: primaryTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: light,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Column(
              children: jobsList.map((JobsModel jobsModel) {
                return RecentJobCard(jobsModel);
              }).toList(),
            )
          ],
        );
      }

      return BlocConsumer<JobsCubit, JobsState>(
        listener: (context, state) {
          if (state is JobsFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is JobsSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _upcomingEvent(),
                SizedBox(height: defaultMargin),
                _recommendedJob(state.jobs),
                SizedBox(height: defaultMargin),
                _recentPostedJob(state.jobs),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: BlocConsumer<JobsCubit, JobsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: defaultMargin,
                  right: defaultMargin,
                  top: defaultMargin + 20,
                  bottom: defaultMargin,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _header(),
                    SizedBox(height: defaultMargin),
                    _body(),
                    SizedBox(height: defaultMargin),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
