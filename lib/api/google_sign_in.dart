import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rakt_daan/api/auth_repo.dart';
import 'package:rakt_daan/routes/routes.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseDatabase fdb = FirebaseDatabase.instance;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  // 🔹 Google Sign-In
  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    return userCredential.user;
  }

// Google sign button to store data in firebase database
  googleSignInButton(context) async {
    User? user = await signInWithGoogle();
    if (user != null) {
      fdb.ref("users").child(user.uid).set({
        "name": user.displayName,
        "email": user.email,
        "phoneNumber": user.phoneNumber,
        "photoURL": user.photoURL,
        "uid": user.uid,
      });
      Get.offAllNamed(AppRoutes.accountCreation);
    }
  }

// for facebook login
  Future<User?> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final AccessToken? accessToken = result.accessToken;

      if (accessToken != null) {
        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.token);

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        return userCredential.user;
      }
    }
    return null;
  }

  facebookSignInButton(context) async {
    User? user = await signInWithFacebook();
    if (user != null) {
      fdb.ref("users").child(user.uid).set({
        "name": user.displayName,
        "email": user.email,
        "phoneNumber": user.phoneNumber,
        "photoURL": user.photoURL,
        "uid": user.uid,
      });
      Get.offAllNamed(AppRoutes.accountCreation);
    }
  }

  // 🔹 Get User Data from Firebase
  Future<Map<String, dynamic>?> getUser() async {
    String? uid = _auth.currentUser?.uid;
    if (uid == null) return null;

    DatabaseReference ref = fdb.ref('users/$uid');
    DataSnapshot snapshot = await ref.get();

    if (snapshot.exists && snapshot.value is Map) {
      return Map<String, dynamic>.from(snapshot.value as Map);
    }
    return null;
  }

  // Sign Out Function
  Future<void> signOut() async {
    await googleSignIn.signOut();
    await FacebookAuth.instance.logOut();
    await AuthRepo.auth.signOut();
    await _auth.signOut();
  }
}
