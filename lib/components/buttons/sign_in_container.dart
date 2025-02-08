import 'package:flutter/material.dart';
import 'package:rakt_daan/utils/colors.dart';

// ignore: must_be_immutable
class SignInButton extends StatelessWidget {
  void Function()? onTap;
  String? imageString;
  SignInButton({
    super.key,
    required this.onTap,
    required this.imageString,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        width: 60,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: ColorConst.sparentOverlay),
            borderRadius: BorderRadius.circular(10)),
        child: Image(image: AssetImage(imageString!)),
      ),
    );
  }
}
