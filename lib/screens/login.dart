// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakt_daan/api/auth_repo.dart';
import 'package:rakt_daan/components/appbar/custom_appbar.dart';
import 'package:rakt_daan/components/buttons/primary_button.dart';
import 'package:rakt_daan/components/progress%20indicator/custom_indicator.dart';
import 'package:rakt_daan/components/textfields/text_input_field.dart';
import 'package:rakt_daan/controllers/text_input_field_controller.dart';
import 'package:rakt_daan/routes/routes.dart';
import 'package:rakt_daan/utils/colors.dart';
import 'package:rakt_daan/utils/image_const.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    final TextEditingController pwdController = TextEditingController();
    TextInputFieldController controller = Get.put(TextInputFieldController());
    return Scaffold(
      appBar: CustomAppbar(
        defaultLeadingIcon: true,
        title: 'Login Screen',
        traillingIcon: false,
      ),
      backgroundColor: ColorConst.darkGrey.withAlpha((0.5 * 255).round()),
      body: SafeArea(
          child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageConst.background),
              fit: BoxFit.cover,
              opacity: .2),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Text(
                '🩸 Login 🩸 ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorConst.primaryGreen,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              Text(
                'Be a Hero, Donate Blood',
                style: TextStyle(
                  color: ColorConst.lightGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 0,
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
              SizedBox(
                width: Get.width * 95,
                height: Get.height * .4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color:
                        ColorConst.primaryBlue.withAlpha((0.5 * 255).round()),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextInputField(
                              validator: (value) {
                                return null;
                              },
                              title: 'Email Id',
                              enabled: true,
                              textEditingController: emailController,
                              hintText: 'Enter Your Email',
                              uniqueTextInputFieldId: 'Email'),
                          SizedBox(
                            height: 12,
                          ),
                          Obx(
                            () => TextInputField(
                              obscureText: controller.passwordVisible.value,
                              validator: (value) {
                                return null;
                              },
                              title: 'Password',
                              enabled: true,
                              textEditingController: pwdController,
                              hintText: 'Enter Password',
                              uniqueTextInputFieldId: 'password',
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    controller.passwordVisible.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: ColorConst.primaryGreen
                                        .withAlpha((.8 * 255).round()),
                                  ),
                                  onPressed: () {
                                    controller.togglePasswordVisibility();
                                  }),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          PrimaryButton(
                              buttonWidth: Get.width * .5,
                              buttonHeight: 50,
                              buttonText: 'Login',
                              onTap: () {
                                if (emailController.text.isNotEmpty &&
                                    pwdController.text.isNotEmpty) {
                                  LoadingDialog.show(
                                      context); // 🔹 Show Loading Dialog

                                  AuthRepo.login(emailController.text,
                                          pwdController.text)
                                      .then((value) {
                                    LoadingDialog.hide(
                                        context); // 🔹 Hide Loading Dialog

                                    Get.snackbar(
                                        'Success', 'Login Successfully',
                                        backgroundColor: ColorConst
                                            .sparentOverlay
                                            .withAlpha((.5 * 255).round()),
                                        colorText: ColorConst.primaryGreen);
                                    if ((value.user != null)) {
                                      AuthRepo.checkUserAndNavigate();
                                    } else {
                                      Get.snackbar('Value', value.toString(),
                                          backgroundColor: ColorConst
                                              .sparentOverlay
                                              .withAlpha((.5 * 255).round()),
                                          colorText: ColorConst.primaryGreen);
                                    }
                                  }).onError((error, stackTrace) {
                                    LoadingDialog.hide(
                                        context); // 🔹 Hide Loading Dialog on Error
                                    if (error is FirebaseAuthException) {
                                      Get.snackbar(
                                          'Error', error.message.toString(),
                                          backgroundColor: ColorConst
                                              .sparentOverlay
                                              .withAlpha((.5 * 255).round()),
                                          colorText: ColorConst.primaryGreen);
                                    } else {
                                      Get.snackbar('Error', error.toString(),
                                          backgroundColor: ColorConst
                                              .sparentOverlay
                                              .withAlpha((.5 * 255).round()),
                                          colorText: ColorConst.primaryGreen);
                                    }
                                  });
                                } else {
                                  Get.snackbar(
                                      'Error', 'Please fill all the field',
                                      backgroundColor: ColorConst.sparentOverlay
                                          .withAlpha((.5 * 255).round()),
                                      colorText: ColorConst.primaryGreen);
                                }
                              },
                              isEnabled: true)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () {
                      showForgetPasswordDialog(context, emailController);
                    },
                    child: Text(
                      'Forget Password',
                      style: TextStyle(
                          fontSize: 15,
                          color: ColorConst.lightGrey,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 18, color: ColorConst.lightGrey),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Get.offAndToNamed(AppRoutes.signUp);
                    },
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                          fontSize: 20,
                          color: ColorConst.primaryGreen,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  void showForgetPasswordDialog(
      BuildContext ctx, TextEditingController emailController) {
    showDialog(
        context: ctx,
        builder: (ctx) => AlertDialog(
            backgroundColor: ColorConst.pureBlack.withAlpha((.5 * 255).round()),
            title: Text(
              'Forget Password',
              style: TextStyle(color: ColorConst.pureWhite),
            ),
            actions: [
              Align(
                alignment: Alignment.center,
                child: PrimaryButton(
                    buttonWidth: Get.width * .5,
                    buttonHeight: 50,
                    buttonText: 'Submit',
                    onTap: () {
                      AuthRepo.auth
                          .sendPasswordResetEmail(email: emailController.text)
                          .then((value) => Get.snackbar('Success',
                              "Reset link sent successfully to your email ${emailController.text}",
                              backgroundColor: ColorConst.sparentOverlay
                                  .withAlpha((.5 * 255).round()),
                              colorText: ColorConst.primaryGreen))
                          .onError((error, stackTrace) => Get.snackbar(
                              'Error', '$error',
                              backgroundColor: ColorConst.sparentOverlay
                                  .withAlpha((.5 * 255).round()),
                              colorText: ColorConst.primaryGreen));
                      Get.back();
                    },
                    isEnabled: true),
              )
            ],
            content: SizedBox(
              height: Get.width * .25,
              child: TextInputField(
                  enabled: true,
                  textEditingController: emailController,
                  hintText: 'Enter Email',
                  uniqueTextInputFieldId: 'Enter Email',
                  title: 'Email'),
            )));
  }
}
