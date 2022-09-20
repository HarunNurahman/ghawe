import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ghawe/models/jobs_model.dart';
import 'package:ghawe/services/job_service.dart';

part 'jobs_state.dart';

class JobsCubit extends Cubit<JobsState> {
  JobsCubit() : super(JobsInitial());

  void fetchJob() async {
    try {
      emit(JobsLoading());
      List<JobsModel> jobList = await JobService().fetchJob();
      emit(JobsSuccess(jobList));
    } catch (e) {
      emit(JobsFailed(e.toString()));
    }
  }
}
