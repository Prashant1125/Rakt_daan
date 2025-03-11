import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rakt_daan/utils/image_const.dart';

class LoadingDialog {
  static bool _isShowing = false;

  static void show(BuildContext context) {
    if (_isShowing) return; // Prevent multiple dialogs
    _isShowing = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          canPop: false, // Prevent back button closing
          child: Dialog(
            backgroundColor: Colors.transparent,
            child: Center(
              child: Lottie.asset(
                ImageConst.loading,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    ).then((_) => _isShowing = false);
  }

  static void hide(BuildContext context) {
    if (_isShowing && Navigator.canPop(context)) {
      _isShowing = false;
      Navigator.of(context).pop();
    }
  }
}
