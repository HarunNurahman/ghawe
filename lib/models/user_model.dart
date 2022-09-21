import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? id;
  final String? email;
  final String? name;
  final String? phone;
  final String? location;
  final String? imgUrl;
  final String? skill;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.location,
    this.imgUrl = '',
    this.skill = 'Junior Developer',
  });

  @override
  List<Object?> get props => [id, email, name, phone, imgUrl, skill, location];
}
