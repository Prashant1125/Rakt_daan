import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakt_daan/controllers/selection%20input%20controller/redio_button_controller.dart';
import 'package:rakt_daan/utils/colors.dart';
import 'package:rakt_daan/utils/image_const.dart';

class RadioButtonTab extends StatefulWidget {
  const RadioButtonTab(
      {super.key,
      required this.buttonTexts,
      required this.buttonWidth,
      required this.buttonCount,
      required this.controller});

  final List<String> buttonTexts;
  final double buttonWidth;
  final int buttonCount;
  final MembershipTypeRadioController controller;

  @override
  State<RadioButtonTab> createState() => _RadioButtonTabState();
}

class _RadioButtonTabState extends State<RadioButtonTab> {
  // final _membershipTypeRadioController = Get.put(MembershipTypeRadioController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Selected Gender',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.0,
              color: ColorConst.pureWhite,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: Get.height * (45 / 800),
          width: Get.width * (332 / 340),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.buttonCount,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    bool atCurrentIndexOrNot =
                        widget.controller.currentIndex.value == index;
                    return InkWell(
                      child: Container(
                        //duration: const Duration(milliseconds: 200),
                        height: screenHeight * (45 / 800),
                        width: widget.buttonWidth,

                        decoration: BoxDecoration(
                            color: atCurrentIndexOrNot
                                ? Colors.transparent
                                : ColorConst.darkBlue,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: atCurrentIndexOrNot
                                    ? ColorConst.primaryGreen
                                    : Colors.transparent,
                                width: atCurrentIndexOrNot ? 1.5 : 0
                                //when clicked then green otherwise transparent

                                )),

                        child: Padding(
                          padding: EdgeInsets.all(atCurrentIndexOrNot ? 4 : 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: atCurrentIndexOrNot
                                  ? ColorConst.darkBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(4),
                              //border: Border.all(color: Colors.red)
                            ),
                            //duration: const Duration(milliseconds: 200),
                            height: atCurrentIndexOrNot
                                ? screenHeight * (37 / 800)
                                : screenHeight * (45 / 800),
                            width: atCurrentIndexOrNot
                                ? widget.buttonWidth - 8
                                : widget.buttonWidth,
                            child: Row(
                              children: [
                                atCurrentIndexOrNot
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.5, horizontal: 6),
                                        child: Image(
                                            image: AssetImage(
                                                ImageConst.radioSelected)),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12,
                                            right: 8,
                                            top: 15.5,
                                            bottom: 15.5),
                                        child: Image(
                                            image: AssetImage(
                                                ImageConst.radioUnSelected)),
                                      ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 8,
                                      top: 8,
                                      bottom: atCurrentIndexOrNot ? 11 : 8,
                                      left: atCurrentIndexOrNot ? 2.7 : 0),
                                  child: SizedBox(
                                    height: screenHeight * (21 / 800),
                                    child: Text(
                                      widget.buttonTexts[index],
                                      style: TextStyle(
                                          color: widget.controller.currentIndex
                                                      .value ==
                                                  index
                                              ? ColorConst.primaryGreen
                                              : ColorConst.pureWhite,
                                          //if selected then changed to green

                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        widget.controller
                            .updateIndex(index, widget.buttonTexts[index]);
                      },
                    );
                  }),
                  index + 1 != widget.buttonCount
                      ? SizedBox(
                          width: 8,
                        )
                      : Container()
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
