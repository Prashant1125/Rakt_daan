import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakt_daan/components/containers/blood_container.dart';
import 'package:rakt_daan/routes/routes.dart';
import 'package:rakt_daan/utils/colors.dart';
import 'package:rakt_daan/utils/image_const.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConst.darkGrey.withAlpha((0.9 * 255).round()),
        body: Container(
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
                BloodContainer(
                  positiveTitle: 'A+',
                  nagetiveTitle: 'A-',
                  negTap: () {
                    Get.toNamed(AppRoutes.listView,
                        arguments: {"bloodGroup": "A-"});
                  },
                  posTap: () {
                    Get.toNamed(AppRoutes.listView,
                        arguments: {"bloodGroup": "A+"});
                  },
                ),
                BloodContainer(
                  positiveTitle: 'B+',
                  nagetiveTitle: 'B-',
                  negTap: () {
                    Get.toNamed(AppRoutes.listView,
                        arguments: {"bloodGroup": "B-"});
                  },
                  posTap: () {
                    Get.toNamed(AppRoutes.listView,
                        arguments: {"bloodGroup": "B+"});
                  },
                ),
                BloodContainer(
                  positiveTitle: 'O+',
                  nagetiveTitle: 'O-',
                  negTap: () {
                    Get.toNamed(AppRoutes.listView,
                        arguments: {"bloodGroup": "O-"});
                  },
                  posTap: () {
                    Get.toNamed(AppRoutes.listView,
                        arguments: {"bloodGroup": "O+"});
                  },
                ),
                BloodContainer(
                  positiveTitle: 'AB+',
                  nagetiveTitle: 'AB-',
                  negTap: () {
                    Get.toNamed(AppRoutes.listView,
                        arguments: {"bloodGroup": "AB-"});
                  },
                  posTap: () {
                    Get.toNamed(AppRoutes.listView,
                        arguments: {"bloodGroup": "AB+"});
                  },
                ),
                BloodContainer(
                  nagetiveTitle: 'Others',
                  negTap: () {
                    Get.toNamed(AppRoutes.listView,
                        arguments: {"bloodGroup": "Not Specified"});
                  },
                  positiveTitle: 'See All',
                  posTap: () {
                    Get.toNamed(AppRoutes.listView,
                        arguments: {"bloodGroup": "All"});
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
