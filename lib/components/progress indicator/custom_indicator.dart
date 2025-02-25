import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rakt_daan/utils/image_const.dart';

class LoadingDialog {
  static Future<void> show(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: Lottie.asset(
              ImageConst.loading,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
  }
}
