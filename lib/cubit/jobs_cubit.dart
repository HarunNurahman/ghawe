import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ghawe/models/jobs_model.dart';

part 'jobs_state.dart';

class JobsCubit extends Cubit<JobsState> {
  JobsCubit() : super(JobsInitial());
}
