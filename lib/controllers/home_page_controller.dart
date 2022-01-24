import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/models/values.dart';
import '/services/init_values.dart';
import '/services/themes.dart';

class HomePageController extends GetxController {


  ScrollController mainScrollController =  ScrollController();
  Values values = Values.data(initValues);

  var horizontalScrollController =
      ScrollController(keepScrollOffset: false).obs;

  void changeSelectedElement(int index) {
    values.selectedElementIndex.value = index;
    Get.changeTheme(index % 2 == 0 ? lightTheme: darkTheme);
    horizontalScrollController.value.animateTo(index * (values.boxWidth + values.separatorWidth),
        duration: values.duration, curve: Curves.easeInCubic);
  }

  @override
  void onInit() {
    super.onInit();
    values.selectedElementIndex.value = values.amountOfElements;
    bool reached = false;
    mainScrollController.addListener(() {
      if (mainScrollController.offset < values.offset) {
        values.angle.value = mainScrollController.offset / values.radialVelocity;
        if (reached) reached = false;
      } else if (mainScrollController.offset >= values.offset) {
        values.angle.value = 0;
        if (!reached) {
          Get.snackbar(
            values.title,
            values.message,
            duration: values.duration,
          );
          reached = true;
        }
      }
    });
  }
}

