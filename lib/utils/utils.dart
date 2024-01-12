import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:get/get.dart';

const _service = 'Utils';

class Utils {
  static final show = _Show();

  static final formatters = _Formatters();

  static final validators = _Validators();

  static void cacheImages(List<String> images) async {
    for (var i = 0; i < images.length; i++) {
      try {
        await precacheImage(AssetImage(images[i]), Get.context!);
      } catch (e) {
        print(e);
      }
    }
  }

  static void closeKeyboard(c) => FocusScope.of(c).requestFocus(FocusNode());
}

class _Formatters {}

class _Validators {}

class _Show {}
