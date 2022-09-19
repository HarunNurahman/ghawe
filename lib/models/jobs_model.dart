import 'package:equatable/equatable.dart';

class JobsModel extends Equatable {
  final String id;
  final String company;
  final String experience;
  final String imgUrl;
  final String jobDesc;
  final String jobRequirement;
  final String jobTitle;
  final String jobType;
  final String location;
  final int salary;

  JobsModel({
    required this.id,
    this.company = '',
    this.experience = '',
    this.imgUrl = '',
    this.jobDesc = '',
    this.jobRequirement = '',
    this.jobTitle = '',
    this.jobType = '',
    this.location = '',
    this.salary = 0,
  });

  factory JobsModel.fromJson(String id, Map<String, dynamic> json) => JobsModel(
        id: id,
        company: json['company'],
        experience: json['experience'],
        imgUrl: json['imgUrl'],
        jobDesc: json['jobDesc'],
        jobRequirement: json['jobRequirement'],
        jobTitle: json['jobTitle'],
        jobType: json['jobType'],
        location: json['location'],
        salary: json['salary'],
      );

  @override
  List<Object?> get props => [
        id,
        company,
        experience,
        imgUrl,
        jobDesc,
        jobRequirement,
        jobTitle,
        jobType,
        location,
        salary,
      ];
}
