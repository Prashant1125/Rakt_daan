import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakt_daan/utils/colors.dart';

class BloodContainer extends StatelessWidget {
  final String positiveTitle;
  final String? nagetiveTitle;
  final double? width;
  final void Function()? negTap;
  final void Function()? posTap;
  const BloodContainer(
      {super.key,
      required this.positiveTitle,
      this.nagetiveTitle,
      this.negTap,
      required this.posTap,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            height: Get.width * .45,
            width: nagetiveTitle == null ? width : Get.width * .45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  Colors.redAccent.withAlpha((.8 * 255).round()),
                  Colors.white
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
            child: InkWell(
              onTap: posTap,
              child: Container(
                  alignment: Alignment.center,
                  height: 95,
                  width: 95,
                  decoration: BoxDecoration(
                      color: ColorConst.sparentOverlay
                          .withAlpha((.3 * 255).round()),
                      borderRadius: BorderRadius.circular(50),
                      border:
                          Border.all(width: 1, color: ColorConst.pureWhite)),
                  child: Text(
                    positiveTitle,
                    style: TextStyle(
                        fontSize: 25,
                        color: ColorConst.pureBlack,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ),
        ),
        Padding(
            padding: nagetiveTitle == null
                ? EdgeInsets.zero
                : const EdgeInsets.all(8.0),
            child: nagetiveTitle == null
                ? null
                : InkWell(
                    onTap: negTap,
                    child: Container(
                      alignment: Alignment.center,
                      height: Get.width * .45,
                      width: Get.width * .45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              ColorConst.primaryBlue
                                  .withAlpha((.9 * 255).round()),
                              Colors.red.shade700.withAlpha((.3 * 255).round()),
                              Colors.red.shade300.withAlpha((.8 * 255).round()),
                              ColorConst.primaryBlue
                                  .withAlpha((.9 * 255).round()),
                            ],
                          )),
                      child: Container(
                          alignment: Alignment.center,
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              color: ColorConst.sparentOverlay
                                  .withAlpha((.3 * 255).round()),
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  width: 1, color: ColorConst.pureWhite)),
                          child: Text(
                            nagetiveTitle!,
                            style: TextStyle(
                                fontSize: 25,
                                color: ColorConst.primaryGreen,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ))
      ],
    );
  }
}
