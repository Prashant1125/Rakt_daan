import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakt_daan/controllers/selection%20input%20controller/date_input_controller.dart';
import 'package:rakt_daan/utils/colors.dart';

class DateInputField extends StatefulWidget {
  const DateInputField({
    super.key,
    required this.enabled,
    required this.hintText,
    required this.uniqueTextInputFieldId,
    this.width,
    required this.isEmpty,
    this.validator,
  });

  final String hintText;
  final String uniqueTextInputFieldId;
  final bool enabled;
  final double? width;
  final RxBool isEmpty;
  final String? Function(String?)? validator;

  @override
  State<DateInputField> createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  final DateInputController datecontroller = Get.put(DateInputController());
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Date of Birth',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.0,
              color: ColorConst.pureWhite,
            ),
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
            Get.put(DateInputController()).removeFocus(); // Deselect the box
          },
          child: Obx(() {
            bool focusedOrNot = Get.put(DateInputController())
                .isFieldFocused(widget.uniqueTextInputFieldId);
            bool isValid = Get.put(DateInputController())
                .isValidDOB
                .value; // Observe DOB validity

            return GestureDetector(
              onTap: () {
                if (widget.enabled) {
                  Get.put(DateInputController())
                      .requestFocus(widget.uniqueTextInputFieldId);
                  _focusNode.requestFocus();
                } else {
                  FocusScope.of(context).unfocus();
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
                          color: !isValid
                              ? ColorConst
                                  .sparentOverlay // Red border for invalid DOB
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
                            decoration: BoxDecoration(
                              color: ColorConst.darkBlue,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: TextFormField(
                              validator: widget.validator,
                              autovalidateMode: AutovalidateMode
                                  .onUserInteraction, // Validate interactively

                              focusNode: _focusNode,
                              cursorColor: ColorConst.offWhite,
                              cursorHeight: 15,
                              controller: datecontroller.textEditingController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                  color: ColorConst.pureWhite,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                                hintText: focusedOrNot ? '' : widget.hintText,
                                border: InputBorder.none,
                                errorStyle: TextStyle(
                                  color: ColorConst.sparentOverlay,
                                  fontSize: 10,
                                ), // Error text style
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.calendar_today,
                                      color: ColorConst.pureWhite),
                                  onPressed: () {
                                    datecontroller.selectDate(context);
                                  },
                                ),
                                counterText: "",
                              ),
                              style: TextStyle(
                                color: ColorConst.pureWhite,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              onTap: () {
                                datecontroller.requestFocus(
                                    widget.uniqueTextInputFieldId);
                              },
                              onChanged: (value) {
                                datecontroller.formatDate(
                                    value); // Validate manually entered DOB
                              },
                            )),
                      ),
                    )
                  : Padding(
                      padding:
                          EdgeInsets.only(bottom: (20 / 800) * deviceHeight),
                      child: Container(
                        height: deviceHeight * (45 / 800),
                        width: widget.width ?? 326,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: ColorConst.darkBlue,
                        ),
                        child: TextFormField(
                          // validator: widget.validator,
                          // autovalidateMode: AutovalidateMode.always,
                          enabled: false,
                          cursorColor: Colors.white10,
                          cursorHeight: 6,
                          decoration: InputDecoration(
                            // hintText: 'DD/MM/YYYY',
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.3, color: ColorConst.pureWhite),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.calendar_today,
                                  color: ColorConst.pureWhite),
                              onPressed: () {
                                datecontroller.selectDate(context);
                              },
                            ),
                            counterText: "",
                          ),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ColorConst.pureWhite,
                          ),
                        ),
                      ),
                    ),
            );
          }),
        ),
      ],
    );
  }
}
