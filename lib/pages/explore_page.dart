import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghawe/cubit/jobs_cubit.dart';
import 'package:ghawe/models/jobs_model.dart';
import 'package:ghawe/pages/widgets/custom_search_bar.dart';
import 'package:ghawe/pages/widgets/recent_job_card.dart';
import 'package:ghawe/shared/style.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget _appBar() {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kWhiteColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Cari Pekerjaan',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget _searchResult(List<JobsModel> jobsList) {
      return Column(
        children: jobsList.map((JobsModel jobsModel) {
          return RecentJobCard(jobsModel);
        }).toList(),
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
          return Scaffold(
            backgroundColor: kWhiteColor,
            appBar: _appBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(defaultMargin),
                child: Column(
                  children: [
                    CustomSearchBar(),
                    const SizedBox(height: 30),
                    _searchResult(state.jobs),
                  ],
                ),
              ),
            ),
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
}
