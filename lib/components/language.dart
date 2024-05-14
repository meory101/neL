import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takatuf/main.dart';
 
class LanguageController extends GetxController {
  String? langcode =
      prefs!.getString("code") != null ? prefs!.getString("code") : "en";
  void ChangeLang(code) async {
    await prefs!.setString("code", code);
    Get.updateLocale(Locale(code));
    // update();
  }

  @override
  void onInit() {
    print(langcode);
    super.onInit();
  }
}
