import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final Function() ontap;
  final String title;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  const SecondaryButton(
      {super.key,
      required this.ontap,
      required this.title,
      this.backgroundColor,
      this.foregroundColor,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        side: BorderSide(color: borderColor ?? Colors.transparent),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
