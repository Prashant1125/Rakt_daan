import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rakt_daan/models/user_data.dart';

class AuthRepo {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseDatabase fdb = FirebaseDatabase.instance;

  static User get user => auth.currentUser!;

// for login with email and password
  static Future<UserCredential> login(email, pwd) {
    try {
      return auth.signInWithEmailAndPassword(email: email, password: pwd);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<UserCredential> signup(email, pwd, String name) async {
    try {
      var userCred = await auth.createUserWithEmailAndPassword(
          email: email, password: pwd);
      var user = userCred.user;
      if (user != null) {
        await user.updateDisplayName(name);
        fdb.ref("users").child(user.uid).set({
          "name": name,
          "email": user.email,
          "phoneNumber": user.phoneNumber,
          "photoURL": user.photoURL,
          "uid": user.uid,
        });
      }
      return userCred;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> saveUserData(UserDataModel user) async {
    await fdb.ref("userInfo").child(user.uid).set(user.toJson());
  }

  // 🔹 यूजर डेटा प्राप्त करें
  Future<UserDataModel?> getUserData(String uid) async {
    DataSnapshot snapshot = await fdb.ref("userInfo").child(user.uid).get();

    if (snapshot.exists && snapshot.value is Map) {
      return UserDataModel.fromJson(
          Map<String, dynamic>.from(snapshot.value as Map));
    }
    return null;
  }
}
