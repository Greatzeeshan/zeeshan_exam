import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class BottomNavBarController extends GetxController {
  PageController pageController = PageController(initialPage: 0);

  RxInt tabIndex = 0.obs;
  var currentIndex = 0.obs;

  void changeTabIndex(int index) async {
    tabIndex.value = index;
    pageController.jumpToPage(tabIndex.value);
    update();
  }
}
