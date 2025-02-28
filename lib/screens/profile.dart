import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import 'package:rakt_daan/api/auth_repo.dart';
import 'package:rakt_daan/api/google_sign_in.dart';
import 'package:rakt_daan/components/settings_container.dart';
import 'package:rakt_daan/models/user_data.dart';
import 'package:rakt_daan/routes/routes.dart';
import 'package:rakt_daan/utils/colors.dart';
import 'package:rakt_daan/utils/image_const.dart';

class ProfilePage extends StatefulWidget {
  final String uid;
  const ProfilePage({
    super.key,
    required this.uid,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserDataModel? userData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    Map<String, dynamic>? userDataMap =
        await AuthRepo().getUserData(widget.uid);

    // Convert the Map<String, dynamic>? to UserDataModel?
    UserDataModel? user =
        userDataMap != null ? UserDataModel.fromMap(userDataMap) : null;

    setState(() {
      userData = user; // Now 'userData' is of type 'UserDataModel?'
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.darkGrey.withAlpha((0.9 * 255).round()),
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
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(9.0),
                  decoration: BoxDecoration(
                      border: GradientBoxBorder(
                        gradient: LinearGradient(
                            colors: [
                              ColorConst.sparentOverlay,
                              Colors.transparent,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(100)),
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        border: GradientBoxBorder(
                          gradient: LinearGradient(
                              colors: [
                                ColorConst.sparentOverlay,
                                ColorConst.sparentOverlay,
                                ColorConst.sparentOverlay,
                                Colors.transparent,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(100)),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(200)),
                      elevation: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(500),
                        child: CachedNetworkImage(
                          width: Get.width * .25,
                          height: Get.width * .25,
                          fit: BoxFit.contain,
                          imageUrl: userData?.profilePicture ??
                              AuthRepo.auth.currentUser?.photoURL ??
                              "",
                          errorWidget: (context, url, error) =>
                              const CircleAvatar(
                            backgroundColor: Colors.black12,
                            child: Icon(
                              Icons.person,
                              size: 50,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  userData?.name ??
                      AuthRepo.auth.currentUser?.displayName ??
                      '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorConst.pureWhite,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Barlow Semi Condensed',
                    height: 0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      trimText(
                          userData?.email ??
                              AuthRepo.auth.currentUser?.email ??
                              '',
                          20),
                      style: TextStyle(
                        color: ColorConst.pureWhite,
                        fontSize: 15,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      AuthRepo.auth.currentUser?.emailVerified ?? false
                          ? "Verified"
                          : "Not verified",
                      style: TextStyle(
                          color:
                              AuthRepo.auth.currentUser?.emailVerified ?? false
                                  ? ColorConst.primaryGreen
                                  : ColorConst.sparentOverlay,
                          fontSize: 10),
                    )
                  ],
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
                const SettingsContainer(),
                InkWell(
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
                  child: Container(
                      alignment: Alignment.center,
                      height: Get.height * .055,
                      width: Get.width * .92,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            width: 1.5,
                            color: ColorConst.primaryBlue,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          color: ColorConst.pureWhite,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String trimText(String text, int length) {
    return text.length > length ? "${text.substring(0, length)}..." : text;
  }
}
