import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakt_daan/api/auth_repo.dart';
import 'package:rakt_daan/components/appbar/custom_appbar.dart';
import 'package:rakt_daan/models/user_data.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments ?? {};
    final String bloodGroup = args["bloodGroup"] ?? "Unknown";
    return Scaffold(
      appBar: CustomAppbar(
          title: '"$bloodGroup Donors"',
          defaultLeadingIcon: true,
          traillingIcon: false),
      body: FutureBuilder<List<UserDataModel>>(
        future: AuthRepo().fetchUsersByBloodGroup(bloodGroup),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
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
              UserDataModel user = users[index];

              return ListTile(
                title: Text(user.name ?? "No Name"),
                subtitle: Text(
                    "Email: ${user.email ?? "N/A"} | Phone: ${user.phoneNumber ?? "N/A"}"),
              );
            },
          );
        },
      ),
    );
  }
}
