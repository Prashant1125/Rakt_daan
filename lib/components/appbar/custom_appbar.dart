import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakt_daan/api/auth_repo.dart';
import 'package:rakt_daan/api/google_sign_in.dart';
import 'package:rakt_daan/routes/routes.dart';
import 'package:rakt_daan/utils/colors.dart';
import 'package:rakt_daan/utils/image_const.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool defaultLeadingIcon;
  final bool traillingIcon;

  final String title;
  final IconData? leadingIcon;
  final Function()? leadingIconTap;
  final Function()? traillingTap;
  const CustomAppbar(
      {super.key,
      required this.title,
      required this.defaultLeadingIcon,
      required this.traillingIcon,
      this.leadingIcon,
      this.leadingIconTap,
      this.traillingTap});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: ColorConst.darkGrey.withAlpha((.9 * 255).round()),
      flexibleSpace: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * (20 / 800),
            ),
            Row(
              children: [
                defaultLeadingIcon
                    ? InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: 35,
                              color: Colors.transparent,
                              child: Image.asset(ImageConst.backButton)),
                        ),
                        onTap: () {
                          Get.back();
                        },
                      )
                    : InkWell(
                        onTap: leadingIconTap,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * (22 / 360),
                              right: screenWidth * (20 / 360)),
                          child: Icon(
                            leadingIcon,
                            color: Colors.white,
                          ),
                        ),
                      ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: screenHeight * (25 / 800)),
                  child: Text(
                    title.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: ColorConst.pureWhite,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * (25 / 800),
                      bottom: screenHeight * (25 / 800),
                      right: screenWidth * (25 / 360)),
                  child: traillingIcon
                      ? PopupMenuButton<int>(
                          offset:
                              Offset(0, 30), // Adjust position below the icon
                          menuPadding: EdgeInsets.all(2),
                          color:
                              ColorConst.darkBlue.withAlpha((.5 * 255).round()),
                          onSelected: (value) {
                            if (value == 1) {
                              AuthService().signOut().then((value) {
                                AuthRepo.auth = FirebaseAuth.instance;
                                Get.snackbar('Success', 'Logout Successfully',
                                    backgroundColor: ColorConst.sparentOverlay
                                        .withAlpha((.5 * 255).round()),
                                    colorText: ColorConst.primaryGreen);
                                Get.offAllNamed(AppRoutes.welcome);
                              });
                            }
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: Row(
                                spacing: 10,
                                children: [
                                  Icon(
                                    Icons.logout_outlined,
                                    color: ColorConst.primaryGreen,
                                  ),
                                  Text(
                                    "Sign Out",
                                    style: TextStyle(
                                        color: ColorConst.primaryGreen),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: ColorConst.primaryGreen,
                                  )
                                ],
                              ),
                            ),
                          ],
                          child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Image.asset(ImageConst.threeDot)),
                        )
                      : null,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
