import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakt_daan/components/buttons/primary_button.dart';
import 'package:rakt_daan/components/selection%20input%20field/custom_dropdown.dart';
import 'package:rakt_daan/components/selection%20input%20field/date_input.dart';
import 'package:rakt_daan/components/selection%20input%20field/location_input.dart';
import 'package:rakt_daan/components/selection%20input%20field/radio_button.dart';
import 'package:rakt_daan/components/textfields/contact_input.dart';
import 'package:rakt_daan/components/textfields/pin_input.dart';
import 'package:rakt_daan/components/textfields/text_input_field.dart';
import 'package:rakt_daan/controllers/selection%20input%20controller/custom_dropdown_contoller.dart';
import 'package:rakt_daan/controllers/selection%20input%20controller/redio_button_controller.dart';
import 'package:rakt_daan/utils/colors.dart';
import 'package:rakt_daan/utils/image_const.dart';

class AccountCreation extends StatelessWidget {
  const AccountCreation({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> bloodGroups = [
      'A+',
      'A-',
      'B+',
      'B-',
      'AB+',
      'AB-',
      'O+',
      'O-',
    ];
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController stateController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController pinController = TextEditingController();
    final MembershipTypeRadioController genderController =
        Get.put(MembershipTypeRadioController());
    final ExpandedDropdownController dropdownController =
        Get.put(ExpandedDropdownController());
    bool isPphoneError = false;

    return Scaffold(
      backgroundColor: ColorConst.darkGrey.withAlpha((0.5 * 255).round()),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConst.background),
                  fit: BoxFit.cover,
                  opacity: .2)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              Text(
                "🩸 Let's Begin 🩸 ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorConst.primaryGreen,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              ),
              Text(
                'Create your account to start your journey',
                style: TextStyle(
                  color: ColorConst.lightGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Divider(
                  thickness: 3,
                  color: ColorConst.primaryBlue.withAlpha((0.5 * 255).round()),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 30,
                    color:
                        ColorConst.primaryBlue.withAlpha((0.5 * 255).round()),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextInputField(
                                title: 'Name',
                                enabled: true,
                                textEditingController: nameController,
                                hintText: 'Enter Your Name',
                                uniqueTextInputFieldId: 'Name'),
                            SizedBox(
                              height: 14,
                            ),
                            TextInputField(
                                title: 'Email Id',
                                enabled: true,
                                textEditingController: emailController,
                                hintText: 'Enter Your Email',
                                uniqueTextInputFieldId: 'Email'),
                            SizedBox(
                              height: 14,
                            ),
                            ContactInputField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return;
                                }
                                return null;
                              },
                              textEditingController: phoneController,
                              hintText: '',
                              uniqueTextInputFieldId: "Manager_Contact",
                              isEmpty: isPphoneError,
                              width: Get.width * 0.975,
                              enabled: true,
                            ),
                            const SizedBox(height: 14.0),
                            DateInputField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return;
                                  }
                                  return null;
                                },
                                uniqueTextInputFieldId: 'Date',
                                hintText: 'DD-MM-YYYY',
                                isEmpty: false.obs,
                                enabled: true,
                                width: Get.height * 0.975),
                            const SizedBox(height: 14.0),
                            SizedBox(
                              height: 14,
                            ),
                            RadioButtonTab(
                              buttonCount: 3,
                              buttonTexts: const ["Male", "Female", "Other"],
                              buttonWidth: Get.width * (102 / 380),
                              controller: genderController,
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            CustomExpandedDropdown(
                              title: 'What is your Blood group?',
                              controller: dropdownController,
                              buttonWidth: 20,
                              buttonHeight: 45,
                              listOfItems: bloodGroups,
                              listOfItemsUniqueId: bloodGroups,
                            ),
                            const SizedBox(height: 14.0),
                            LocationInputField(
                              hintText: "Enter your colony of locality",
                            ),
                            const SizedBox(height: 14.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextInputField(
                                  title: 'City',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return;
                                    }
                                    return null;
                                  },
                                  enabled: true,
                                  textEditingController: cityController,
                                  hintText: "Enter City",
                                  uniqueTextInputFieldId: 'City',
                                  width: Get.width * .40,
                                ),
                                TextInputField(
                                  title: 'State',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return;
                                    }
                                    return null;
                                  },
                                  enabled: true,
                                  textEditingController: stateController,
                                  hintText: " Enter State",
                                  uniqueTextInputFieldId: 'State',
                                  width: Get.width * .40,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextInputField(
                                  title: 'Country',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return;
                                    }
                                    return null;
                                  },
                                  enabled: true,
                                  textEditingController: countryController,
                                  hintText: " Enter Country",
                                  uniqueTextInputFieldId: 'Country',
                                  width: Get.width * .40,
                                ),
                                PinInputField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return;
                                    }
                                    return null;
                                  },
                                  textEditingController: pinController,
                                  hintText: " Enter Pin",
                                  uniqueTextInputFieldId: 'Pin',
                                  width: Get.width * .40,
                                  enabled: true,
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            const SizedBox(
                              height: 30,
                            ),
                            PrimaryButton(
                                buttonWidth: Get.width * .9,
                                buttonHeight: 50,
                                buttonText: 'Submit',
                                onTap: () {},
                                isEnabled: true)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
