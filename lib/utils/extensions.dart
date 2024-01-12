import 'package:get/get.dart';

extension Responsive on num {
  double get w => this * Get.width / 378;
  double get h => this * Get.height / 812;
}
