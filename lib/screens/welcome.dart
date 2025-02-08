import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakt_daan/api/google_sign_in.dart';
import 'package:rakt_daan/components/buttons/secondary_button.dart';
import 'package:rakt_daan/components/buttons/sign_in_container.dart';
import 'package:rakt_daan/routes/routes.dart';
import 'package:rakt_daan/utils/colors.dart';
import 'package:rakt_daan/utils/image_const.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.darkGrey.withAlpha((0.5 * 255).round()),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConst.background),
                  fit: BoxFit.cover,
                  opacity: .2)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Text(
                  '🩸 Rakt Daan 🩸 ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorConst.primaryGreen,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                Text(
                  'Be a Hero, Donate Blood',
                  style: TextStyle(
                    color: ColorConst.lightGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Divider(
                    thickness: 3,
                    color:
                        ColorConst.primaryBlue.withAlpha((0.5 * 255).round()),
                  ),
                ),
                SizedBox(
                  height: Get.height * .2,
                  width: Get.width * .95,
                  child: Card(
                    elevation: 30,
                    color:
                        ColorConst.primaryBlue.withAlpha((0.5 * 255).round()),
                    child: Image(
                      image: AssetImage(ImageConst.motiveQuote),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * .4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 30,
                      color:
                          ColorConst.primaryBlue.withAlpha((0.5 * 255).round()),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SecondaryButton(
                              ontap: () {
                                Get.toNamed(AppRoutes.login);
                              },
                              title: "LOGIN",
                              backgroundColor: ColorConst.pureWhite,
                              foregroundColor: ColorConst.sparentOverlay,
                              borderColor: ColorConst.sparentOverlay,
                            ),
                            const SizedBox(height: 15),
                            SecondaryButton(
                              ontap: () {
                                Get.toNamed(AppRoutes.signUp);
                              },
                              title: "SIGN UP",
                              backgroundColor: ColorConst.sparentOverlay,
                              foregroundColor: ColorConst.pureWhite,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Sign with Social Media",
                              style: TextStyle(
                                  fontSize: 16, color: ColorConst.offWhite),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // for facebook sign in
                                SignInButton(
                                    onTap: () async {
                                      AuthService()
                                          .facebookSignInButton(context);
                                    },
                                    imageString: ImageConst.facebook),

                                // for google sign in

                                SignInButton(
                                    onTap: () async {
                                      AuthService().googleSignInButton(context);
                                    },
                                    imageString: ImageConst.google),

                                // for linkdin sign in

                                SignInButton(
                                    onTap: () {
                                      Get.snackbar('Coming Soon',
                                          'this feature is not available on this time',
                                          backgroundColor: ColorConst
                                              .sparentOverlay
                                              .withAlpha((.5 * 255).round()),
                                          colorText: ColorConst.primaryGreen);
                                    },
                                    imageString: ImageConst.linkdin),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Divider(
                    thickness: 3,
                    color:
                        ColorConst.primaryBlue.withAlpha((0.5 * 255).round()),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style:
                          TextStyle(fontSize: 18, color: ColorConst.lightGrey),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.signUp);
                      },
                      child: Text(
                        'SignUp',
                        style: TextStyle(
                            fontSize: 20,
                            color: ColorConst.primaryGreen,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
