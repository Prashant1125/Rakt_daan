// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakt_daan/api/auth_repo.dart';
import 'package:rakt_daan/components/appbar/custom_appbar.dart';
import 'package:rakt_daan/components/containers/user_card.dart';
import 'package:rakt_daan/components/progress%20indicator/custom_indicator.dart';
import 'package:rakt_daan/models/user_data.dart';
import 'package:rakt_daan/utils/colors.dart';
import 'package:rakt_daan/utils/image_const.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments ?? {};
    final String bloodGroup = args["bloodGroup"] ?? "Unknown";
    return Scaffold(
      backgroundColor: ColorConst.darkGrey.withAlpha((0.9 * 255).round()),
      appBar: CustomAppbar(
          title: '$bloodGroup Donors',
          defaultLeadingIcon: true,
          traillingIcon: false),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageConst.background),
                fit: BoxFit.cover,
                opacity: .2)),
        child: FutureBuilder<List<UserDataModel>>(
          future: AuthRepo().fetchUsersByBloodGroup(bloodGroup),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              Future.microtask(
                  () => LoadingDialog.show(context)); // ✅ Delayed Call
              return SizedBox(); // ✅ Empty Placeholder Widget
            } else {
              Future.microtask(
                  () => LoadingDialog.hide(context)); // ✅ Hide Dialog Safely
            }
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No donors found for $bloodGroup"));
            }

            List<UserDataModel> users = snapshot.data!;

            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return UserCard(user: users[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
