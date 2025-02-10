import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakt_daan/api/auth_repo.dart';
import 'package:rakt_daan/components/appbar/custom_appbar.dart';
import 'package:rakt_daan/controllers/nav%20bar/bottom_bar_controller.dart';
import 'package:rakt_daan/screens/homepage.dart';
import 'package:rakt_daan/screens/profile.dart';
import 'package:rakt_daan/utils/colors.dart';

class BottomBar extends StatelessWidget {
  BottomBar({super.key});

  final BottomBarController controller = Get.put(BottomBarController());

  final List<Widget> widgetList = [
    Homepage(),
    ProfilePage(
      uid: AuthRepo.user.uid,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          title: 'HomePage',
          defaultLeadingIcon: false,
          leadingIcon: Icons.home,
          traillingIcon: true),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: ColorConst.darkGrey.withAlpha((.9 * 255).round()),
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: ColorConst.primaryGreen,
          onTap: controller.changeIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Home", tooltip: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "My Profile",
                tooltip: 'My Profile'),
          ],
        ),
      ),
      body: Obx(() => widgetList[controller.selectedIndex.value]),
    );
  }
}
