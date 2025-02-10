import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  final Function()? onTap;
  final String? image;
  const CircularContainer(
      {super.key, required this.onTap, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          image.toString(),
        ),
      ),
    );
  }
}
