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
        'imgUrl': userModel.imgUrl,
        'skill': userModel.skill,
        'location': userModel.location,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await userReference.doc(id).get();
      return UserModel(
        id: id,
        email: snapshot['email'],
        name: snapshot['name'],
        phone: snapshot['phone'],
        location: snapshot['location'],
        imgUrl: snapshot['imgUrl'],
        skill: snapshot['skill'],
      );
    } catch (e) {
      rethrow;
    }
  }
}
