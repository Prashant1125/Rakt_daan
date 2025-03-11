import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakt_daan/api/auth_repo.dart';
import 'package:rakt_daan/components/appbar/custom_appbar.dart';
import 'package:rakt_daan/components/containers/user_card.dart';
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
  List<UserDataModel> allUsers = [];
  List<UserDataModel> filteredUsers = [];
  TextEditingController searchController = TextEditingController();
  bool isLoading = true; // ✅ Loading State

  @override
  void initState() {
    super.initState();
    final Map<String, dynamic> args = Get.arguments ?? {};
    bloodGroup = args["bloodGroup"] ?? "All";
    _fetchUsers(bloodGroup);
  }

  Future<void> _fetchUsers(String bloodGroup) async {
    setState(() => isLoading = true);

    try {
      List<UserDataModel> users = await AuthRepo()
          .fetchUsersByBloodGroup(bloodGroup == "All" ? null : bloodGroup);

      setState(() {
        allUsers = users;
        filteredUsers = users;
      });
    } catch (e) {
      // print("Error fetching users: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  void _filterUsers(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredUsers = allUsers; // ✅ Reset if empty
      } else {
        filteredUsers = allUsers.where((user) {
          final city = user.city?.toLowerCase() ?? '';
          final state = user.state?.toLowerCase() ?? ''; // ✅ State Check
          final searchText = query.toLowerCase();

          return city.contains(searchText) ||
              state.contains(searchText); // ✅ City + State Filter
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.darkGrey.withAlpha((0.9 * 255).round()),
      appBar: CustomAppbar(
        title: '$bloodGroup Donors',
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search by City or State...",
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none),
                ),
                onChanged: _filterUsers, // ✅ Updated Filter
              ),
            ),
            Expanded(
              child: isLoading
                  ? Center(child: CircularProgressIndicator()) // ✅ Loader
                  : filteredUsers.isEmpty
                      ? Center(
                          child: Text(
                            "No donors found for $bloodGroup",
                            style: TextStyle(
                                fontSize: 20, color: ColorConst.primaryGreen),
                          ),
                        )
                      : ListView.builder(
                          itemCount: filteredUsers.length,
                          itemBuilder: (context, index) {
                            return UserCard(user: filteredUsers[index]);
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
