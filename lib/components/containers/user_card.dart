import 'package:flutter/material.dart';
import 'package:rakt_daan/components/containers/container.dart';
import 'package:rakt_daan/models/user_data.dart';
import 'package:rakt_daan/utils/image_const.dart';
import 'package:url_launcher/url_launcher.dart';

class UserCard extends StatelessWidget {
  final UserDataModel user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Colors.redAccent.withAlpha((.8 * 255).round()),
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name ?? "No Name",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    trimText(user.email ?? "No Email", 23),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    trimText(user.phoneNumber ?? "No number", 23),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Address: ${trimText(user.location ?? "No Address", 23)}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${trimText(user.city ?? "No City", 23)}, ${trimText(user.state ?? "No State", 23)}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${trimText(user.country ?? "No Country", 23)}, ${trimText(user.pinCode ?? "No Pin", 23)}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Blood Group: ${user.bloodGroup ?? 'Unknown'}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                CircularContainer(
                  hieght: 50,
                  width: 50,
                  onTap: () {
                    launchUrl(Uri.parse(user.phoneNumber.toString()));
                  },
                  icon: Icons.call,
                  iconColor: Colors.deepOrange,
                ),
                SizedBox(height: 8),
                CircularContainer(
                  hieght: 50,
                  width: 50,
                  onTap: () {
                    launchUrl(Uri.parse(user.email.toString()));
                  },
                  icon: Icons.email,
                  iconColor: Colors.deepPurpleAccent,
                ),
                SizedBox(height: 8),
                CircularContainer(
                    hieght: 50,
                    width: 50,
                    onTap: () {},
                    image: ImageConst.whatshappIcon),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String trimText(String text, int length) {
    return text.length > length ? "${text.substring(0, length)}..." : text;
  }
}
