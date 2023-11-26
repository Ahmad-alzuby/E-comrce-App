
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zosr/core/constant/colors.dart';
import 'package:zosr/core/localizaton/localization_controllaer.dart';

class ChangeThemWidget extends StatelessWidget {
  const ChangeThemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocaleController>(
      builder: (controller) => controller.brightness.value ==
              Brightness.light
          ? AnimatedContainer(
            duration: const Duration(milliseconds: 300),
              width: 150,
              child: AnimatedContainer(
                  duration: const Duration(microseconds: 500),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(ColorApp.graey)),
                    onPressed: () async {
                      await controller.chngeThem(Brightness.dark.obs);
                    },
                    child:   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(Icons.dark_mode),
                        Text("dark mode".tr),
                      ],
                    ),
                  )),
            )
          : AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(249, 78, 77, 77))),
                  onPressed: () async {
                    await controller.chngeThem(Brightness.light.obs);
                  },
                  child:   AnimatedContainer(
duration: const Duration(milliseconds: 300),
                    width: 150,
                    child:   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("light mode".tr),
                        const Icon(Icons.light_mode),
                      ],
                    ),
                  )),
            ),
    );
  }
}
