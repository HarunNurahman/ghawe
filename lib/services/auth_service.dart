import 'package:firebase_auth/firebase_auth.dart';
import 'package:ghawe/models/user_model.dart';
import 'package:ghawe/services/user_service.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel userModel = UserModel(
        id: user.user!.uid,
        email: email,
        name: name,
        phone: phone,
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
