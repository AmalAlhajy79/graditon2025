

import 'dart:math';

import 'package:get/get.dart';

extension AppSizer on num {

  double get _w => min(Get.width, Get.height);

  double get _h => max(Get.width, Get.height);

  double get w => this * (_w/100);

  double get h => this * (_h/100);

  double get sp => this * (_w/300);


}