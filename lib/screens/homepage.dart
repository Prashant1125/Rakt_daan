import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rakt_daan/utils/colors.dart';
import 'package:rakt_daan/utils/image_const.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConst.darkGrey.withAlpha((0.9 * 255).round()),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConst.background),
                  fit: BoxFit.cover,
                  opacity: .2)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                              ColorConst.darkGrey.withAlpha((.9 * 255).round()),
                              Colors.red.shade700.withAlpha((.3 * 255).round()),
                              Colors.red.shade300.withAlpha((.8 * 255).round()),
                              ColorConst.darkGrey.withAlpha((.9 * 255).round()),
                            ],
                          )),
                      child: Container(
                          alignment: Alignment.center,
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            'O+',
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
