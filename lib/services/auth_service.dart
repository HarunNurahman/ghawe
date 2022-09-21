import 'package:firebase_auth/firebase_auth.dart';
import 'package:ghawe/models/user_model.dart';
import 'package:ghawe/services/user_service.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel userModel = await UserService().getUserById(
        userCredential.user!.uid,
      );

      return userModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String location,
  }) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        email: email,
        name: name,
        phone: phone,
        location: location,
      );

      await UserService().setUser(userModel);
      return userModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
