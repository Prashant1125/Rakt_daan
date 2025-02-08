import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakt_daan/controllers/selection%20input%20controller/location_controller.dart';

class LocationInputController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  final LocationController locationController = Get.put(LocationController());

  Future<String> pickLocation(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return "${locationController.currentAddress}";
  }
}
