import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ghawe/models/user_model.dart';
import 'package:ghawe/services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      emit(AuthLoading());
      UserModel userModel = await AuthService().signUp(
        name: name,
        email: email,
        password: password,
        phone: phone,
      );

      emit(AuthSuccess(userModel));
    } catch (e) {
      emit(
        AuthFailed(
          e.toString(),
        ),
      );
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());
      await AuthService().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(
        AuthFailed(
          e.toString(),
        ),
      );
    }
  }
}
