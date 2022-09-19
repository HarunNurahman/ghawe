import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ghawe/models/user_model.dart';
import 'package:ghawe/services/auth_service.dart';
import 'package:ghawe/services/user_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signIn({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());

      UserModel userModel = await AuthService().signIn(
        email: email,
        password: password,
      );
      emit(AuthSuccess(userModel));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

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

  void getCurrentUser(String id) async {
    try {
      UserModel userModel = await UserService().getUserById(id);
      emit(AuthSuccess(userModel));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
