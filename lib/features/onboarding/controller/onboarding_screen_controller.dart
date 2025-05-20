import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardingScreenController extends GetxController {
  final pageController = PageController().obs;
  RxInt currentPage = 0.obs;
}
