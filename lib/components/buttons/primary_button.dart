import 'package:flutter/material.dart';
import 'package:rakt_daan/utils/colors.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton(
      {super.key,
      required this.buttonWidth,
      required this.buttonHeight,
      required this.buttonText,
      required this.onTap,
      required this.isEnabled});

  final double buttonHeight;
  final double? buttonWidth;
  final String buttonText;
  final VoidCallback onTap;
  final bool isEnabled;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          widget.onTap();
        },
        child: Container(
          width: widget.buttonWidth,
          height: widget.buttonHeight,
          decoration: BoxDecoration(
              color: widget.isEnabled
                  ? ColorConst.primaryGreen
                  : ColorConst.primaryGreen.withAlpha((0.5 * 255).round()),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: ColorConst.primaryGreen,
                  width: widget.isEnabled ? 0 : 1)),
          child: Center(
            child: Text(
              widget.buttonText,
              style: TextStyle(
                color: ColorConst.pureBlack,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ));
  }
}
