import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakt_daan/routes/routes.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => getIsLogin());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // कुछ UI देना ज़रूरी है
      body: Center(child: CircularProgressIndicator()), // लोडिंग UI
    );
  }

  void getIsLogin() {
    Get.offAllNamed(
      FirebaseAuth.instance.currentUser != null
          ? AppRoutes.bottom
          : AppRoutes.welcome,
    );
  }
}
