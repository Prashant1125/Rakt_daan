import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakt_daan/api/auth_repo.dart';
import 'package:rakt_daan/components/appbar/custom_appbar.dart';
import 'package:rakt_daan/components/containers/user_card.dart';
import 'package:rakt_daan/components/progress%20indicator/custom_indicator.dart';
import 'package:rakt_daan/models/user_data.dart';
import 'package:rakt_daan/utils/colors.dart';
import 'package:rakt_daan/utils/image_const.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  late String bloodGroup;
  late Future<List<UserDataModel>> futureUsers;

  @override
  void initState() {
    super.initState();
    final Map<String, dynamic> args = Get.arguments ?? {};

    // ✅ "See All" पर क्लिक करने पर "All" दिखाएँ लेकिन API में null भेजें
    bloodGroup = args["bloodGroup"] ?? "All";
    String? queryBloodGroup = (bloodGroup == "All") ? null : bloodGroup;

    futureUsers = _fetchUsers(queryBloodGroup);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.darkGrey.withAlpha((0.9 * 255).round()),
      appBar: CustomAppbar(
        title: '$bloodGroup Donors', // ✅ Dynamic AppBar Title
        defaultLeadingIcon: true,
        traillingIcon: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConst.background),
            fit: BoxFit.cover,
            opacity: .2,
          ),
        ),
        child: FutureBuilder<List<UserDataModel>>(
          future: futureUsers,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              _showLoadingDialog();
              return const SizedBox();
            } else {
              _hideLoadingDialog();
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

  /// ✅ API से डाटा लाने का सही तरीका (अब "See All" के लिए null भेजेंगे)
  Future<List<UserDataModel>> _fetchUsers(String? bloodGroup) async {
    try {
      return await AuthRepo().fetchUsersByBloodGroup(bloodGroup);
    } catch (e) {
      print("Error fetching users: $e");
      return [];
    }
  }

  /// ✅ सही तरीके से Loading Dialog दिखाएँ
  void _showLoadingDialog() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) LoadingDialog.show(context);
    });
  }

  /// ✅ सही तरीके से Loading Dialog छिपाएँ
  void _hideLoadingDialog() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) LoadingDialog.hide(context);
    });
  }
}
