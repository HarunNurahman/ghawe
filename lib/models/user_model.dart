import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String phone;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
  });

  @override
  List<Object?> get props => [id, email, name, phone];
}
