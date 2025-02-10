import 'package:flutter/material.dart';

import 'package:rakt_daan/utils/colors.dart';
import 'package:rakt_daan/utils/image_const.dart';

class ElementTile extends StatelessWidget {
  final String? leadingIcon;
  final Color? color;
  final String? text;
  final void Function()? onTap;
  const ElementTile({
    super.key,
    this.leadingIcon,
    this.text,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
          height: 30,
          width: 28,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(4)),
          child: leadingIcon != null
              ? Image.asset(
                  leadingIcon ?? '',
                )
              : Image.asset(
                  ImageConst.userCheak,
                )),
      title: Text(text.toString(),
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ColorConst.pureWhite)),
      trailing: Image.asset(ImageConst.arrowRight),
      onTap: onTap,
    );
  }
}
