import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ghawe/models/user_model.dart';

class UserService {
  CollectionReference userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel userModel) async {
    try {
      userReference.doc(userModel.id).set({
        'name': userModel.name,
        'email': userModel.email,
        'phone': userModel.phone,
      });
    } catch (e) {
      rethrow;
    }
  }
}
