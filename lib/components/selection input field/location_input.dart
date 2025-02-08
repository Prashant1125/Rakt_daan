import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakt_daan/controllers/selection%20input%20controller/location_input_controller.dart';
import 'package:rakt_daan/utils/colors.dart';

class LocationInputField extends StatelessWidget {
  final LocationInputController controller = Get.put(LocationInputController());

  final String hintText;
  final TextStyle? hintStyle;

  LocationInputField({
    super.key,
    required this.hintText,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Address line 1',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.0,
              color: ColorConst.pureWhite,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: controller.textEditingController,
          keyboardType: TextInputType.text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.0,
            color: ColorConst.pureWhite,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle ??
                TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ColorConst.pureWhite,
                ),
            filled: true,
            fillColor: ColorConst.darkBlue,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: ColorConst.primaryGreen),
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.location_pin, color: ColorConst.pureWhite),
              onPressed: () async {
                String location = await controller.pickLocation(context);
                controller.textEditingController.text = location;
              },
            ),
          ),
        ),
      ],
    );
  }
}
