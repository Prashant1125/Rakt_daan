import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakt_daan/api/auth_repo.dart';
import 'package:rakt_daan/api/google_sign_in.dart';
import 'package:rakt_daan/components/appbar/custom_appbar.dart';
import 'package:rakt_daan/components/buttons/primary_button.dart';
import 'package:rakt_daan/routes/routes.dart';
import 'package:rakt_daan/utils/colors.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        traillingIcon: true,
        leadingicon: Icons.home,
        title: 'HomePage',
        leadingIcon: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
                buttonWidth: Get.width * .5,
                buttonHeight: 50,
                buttonText: 'Log Out',
                onTap: () {
                  AuthService().signOut().then((value) {
                    AuthRepo.auth = FirebaseAuth.instance;
                    Get.snackbar('Success', 'Logout Successfully',
                        backgroundColor: ColorConst.sparentOverlay
                            .withAlpha((.5 * 255).round()),
                        colorText: ColorConst.primaryGreen);
                    Get.offAllNamed(AppRoutes.welcome);
                  });
                },
                isEnabled: true)
          ],
        ),
      ),
    );
  }
}
