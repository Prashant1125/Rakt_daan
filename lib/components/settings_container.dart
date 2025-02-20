// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakt_daan/api/auth_repo.dart';
import 'package:rakt_daan/components/element_tile.dart';
import 'package:rakt_daan/components/progress%20indicator/custom_indicator.dart';
import 'package:rakt_daan/routes/routes.dart';
import 'package:rakt_daan/utils/colors.dart';
import 'package:rakt_daan/utils/image_const.dart';
import 'character_input_field/section_break.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 30,
        color: ColorConst.primaryBlue.withAlpha((0.35 * 255).round()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionBreak(
              sectionTitle: 'Personal & Business',
              sectionDescription: ElementTile(
                  leadingIcon: ImageConst.user,
                  text: 'Personal Details',
                  color: ColorConst.primaryBlue.withAlpha((0.3 * 255).round()),
                  onTap: () {
                    Get.toNamed(AppRoutes.update);
                  }),
            ),
            SectionBreak(
              sectionTitle: 'Verification',
              sectionDescription: ElementTile(
                leadingIcon: ImageConst.userCheak,
                text: 'Verify your email',
                color:
                    ColorConst.sparentOverlay.withAlpha((0.70 * 255).round()),
                onTap: () {
                  LoadingDialog.show(context);
                  AuthRepo.auth.currentUser
                      ?.sendEmailVerification()
                      .then((value) {
                    LoadingDialog.hide(context);

                    AuthRepo.auth.currentUser?.reload();
                    return Get.snackbar("Verification link sent successfully!",
                        'Cheak your email & verify',
                        backgroundColor: ColorConst.sparentOverlay
                            .withAlpha((.5 * 255).round()),
                        colorText: ColorConst.primaryGreen);
                  });
                },
              ),
            ),
            SectionBreak(
              sectionTitle: 'Help & Supoort',
              sectionDescription: ElementTile(
                leadingIcon: ImageConst.contactIcon,
                onTap: () {
                  Get.toNamed(AppRoutes.contact);
                },
                text: 'Contact Us',
                color: ColorConst.offWhite.withAlpha((0.3 * 255).round()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
