import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakt_daan/models/user_data.dart';
import 'package:rakt_daan/routes/routes.dart';

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
    await fdb.ref("userInfo").child(user.uid).set(user.toMap());
  }

  // 🔹 यूजर डेटा प्राप्त करें
  Future<Map<String, dynamic>?> getUserData(String uid) async {
    DataSnapshot snapshot = await fdb.ref("userInfo").child(user.uid).get();

    if (snapshot.exists && snapshot.value is Map) {
      return Map<String, dynamic>.from(snapshot.value as Map);
    }
    return null;
  }

// for update an info of user
  Future<void> updateUserData(UserDataModel user) async {
    await fdb.ref("userInfo").child(user.uid).update(user.toMap());
  }

  static Future<void> checkUserAndNavigate() async {
    String? uid = auth.currentUser?.uid;

    if (uid == null) {
      Get.snackbar("Error", "User not logged in",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }

    DataSnapshot snapshot = await fdb.ref("userInfo").child(uid).get();

    if (snapshot.exists) {
      Get.offAllNamed(AppRoutes.bottom);
    } else {
      Get.offAllNamed(AppRoutes.accountCreation);
    }
  }

  // for fetch all the user data
  Future<List<UserDataModel>> fetchUsersByBloodGroup(String bloodGroup) async {
    List<UserDataModel> userList = [];

    try {
      DatabaseEvent event = await fdb.ref('userInfo').once();
      if (event.snapshot.value != null && event.snapshot.value is Map) {
        Map<dynamic, dynamic> data = event.snapshot.value as Map;

        data.forEach((key, value) {
          UserDataModel user =
              UserDataModel.fromMap(Map<String, dynamic>.from(value));

          if (user.bloodGroup == bloodGroup) {
            userList.add(user);
          }
        });
      }
    } catch (e) {
      // print("Error fetching users: $e");
    }

    return userList;
  }
}
