import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakt_daan/controllers/text_input_field_controller.dart';
import 'package:rakt_daan/utils/colors.dart';

class ContactInputField extends StatefulWidget {
  const ContactInputField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    required this.uniqueTextInputFieldId,
    this.width,
    required this.enabled,
    required bool isEmpty,
    this.validator,
  });

  final TextEditingController textEditingController;
  final String hintText;
  final String uniqueTextInputFieldId;
  final double? width;
  final bool enabled;
  final String? Function(String?)? validator;

  @override
  State<ContactInputField> createState() => _ContactInputFieldState();
}

class _ContactInputFieldState extends State<ContactInputField> {
  final _textInputFieldController = Get.put(TextInputFieldController());
  final RxBool _isEmpty = true.obs; // Tracks whether the field is empty.

  @override
  void initState() {
    super.initState();
    widget.textEditingController.addListener(() {
      _isEmpty.value = widget.textEditingController.text.isEmpty;
      final text = widget.textEditingController.text.replaceAll('-', '');
      if (text.length > 10) {
        widget.textEditingController.text = text.substring(0, 10);
      }
      if (text.length <= 10) {
        final formattedText = text.length > 5
            ? '${text.substring(0, 5)}-${text.substring(5)}'
            : text;
        widget.textEditingController.value = TextEditingValue(
          text: formattedText,
          selection: TextSelection.collapsed(offset: formattedText.length),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Phone Number',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.0,
              color: ColorConst.pureWhite,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Obx(() {
          bool focusedOrNot = _textInputFieldController
              .isFieldFocused(widget.uniqueTextInputFieldId);

          return GestureDetector(
            onTap: () {
              if (widget.enabled) {
                _textInputFieldController
                    .requestFocus(widget.uniqueTextInputFieldId);
              } else {
                // print('it is false**********************************');
              }
            },
            child: widget.enabled
                ? AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: widget.width ?? 326,
                    height: 45,
                    decoration: BoxDecoration(
                      color: focusedOrNot
                          ? Colors.transparent
                          : ColorConst.darkBlue,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: _isEmpty.value
                            ? ColorConst.sparentOverlay // Red border when empty
                            : (focusedOrNot
                                ? ColorConst
                                    .primaryGreen // Green border when focused
                                : Colors.transparent), // Default border
                        width: 1.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: focusedOrNot
                            ? (widget.width ?? 318)
                            : (widget.width ?? 326),
                        height: focusedOrNot ? 37 : 45,
                        decoration: BoxDecoration(
                          color: ColorConst.darkBlue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: TextFormField(
                          validator: widget.validator,
                          keyboardType: TextInputType.number,
                          cursorColor: ColorConst.pureWhite,
                          cursorHeight: 15,
                          controller: widget.textEditingController,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: ColorConst.pureWhite,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                            hintText: focusedOrNot ? '+91' : widget.hintText,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                bottom: focusedOrNot ? 13 : 14,
                                left: focusedOrNot ? 19 : 20,
                                top: 12,
                                right: 20),
                          ),
                          style: TextStyle(
                            color: ColorConst.pureWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          onTap: () {
                            _textInputFieldController
                                .requestFocus(widget.uniqueTextInputFieldId);
                          },
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(bottom: (20 / 800) * deviceHeight),
                    child: Container(
                      height: deviceHeight * (45 / 800),
                      width: widget.width ?? 326,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: ColorConst.darkBlue,
                      ),
                      child: TextFormField(
                        validator: widget.validator,
                        enabled: false,
                        cursorColor: Colors.white10,
                        cursorHeight: 6,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              bottom: 12, left: 20, top: 12, right: 20),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0.3, color: ColorConst.pureWhite),
                            borderRadius: BorderRadius.circular(8),
                            gapPadding: 2,
                          ),
                          errorText: '',
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorConst.sparentOverlay,
                              width: 1.5,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            gapPadding: 1,
                          ),
                          enabledBorder: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              strokeAlign: 2,
                              width: 1.5,
                              style: BorderStyle.solid,
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.5,
                                  strokeAlign: 2,
                                  color: ColorConst.primaryGreen,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(8),
                              gapPadding: 2),
                        ),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorConst.pureWhite,
                        ),
                        maxLength: 30,
                        buildCounter: (context,
                            {required currentLength,
                            required isFocused,
                            required maxLength}) {
                          return null;
                        },
                      ),
                    ),
                  ),
          );
        }),
      ],
    );
  }
}
