part of 'jobs_cubit.dart';

abstract class JobsState extends Equatable {
  const JobsState();

  @override
  List<Object> get props => [];
}

class JobsInitial extends JobsState {}

class JobsLoading extends JobsState {}

class JobsSuccess extends JobsState {
  final List<JobsModel> jobs;

  JobsSuccess(this.jobs);

  @override
  List<Object> get props => [jobs];
}

class JobsFailed extends JobsState {
  final String error;

  JobsFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
