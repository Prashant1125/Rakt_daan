import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakt_daan/utils/colors.dart';
import 'package:rakt_daan/utils/image_const.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool leadingIcon;
  final bool traillingIcon;
  final String title;
  final IconData? leadingicon;
  const CustomAppbar(
      {super.key,
      required this.title,
      required this.leadingIcon,
      required this.traillingIcon,
      this.leadingicon});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: ColorConst.pureBlack,
      flexibleSpace: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * (20 / 800),
            ),
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * (22 / 360),
                        right: screenWidth * (20 / 360)),
                    child: leadingIcon
                        ? InkWell(
                            child: Image.asset(ImageConst.backButton),
                            onTap: () {
                              Get.back();
                            },
                          )
                        : InkWell(
                            child: Icon(
                              leadingicon,
                              color: Colors.white,
                            ),
                            onTap: () {},
                          )),
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
                        ? InkWell(
                            child: Image.asset(ImageConst.threeDot),
                          )
                        : null)
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
