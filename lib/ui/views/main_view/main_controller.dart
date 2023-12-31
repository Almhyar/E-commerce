import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/enums/bottom_navigation_enum.dart';
import 'package:store/core/services/base_controller.dart';

class MainController extends BaseController {
  PageController pageController = PageController(initialPage: 1);
  late Rx<BottomNavigationEnum> selected = BottomNavigationEnum.HOME.obs;

  void onClick(BottomNavigationEnum select, int pageNumber) {
    selected.value = select;
    pageController.jumpToPage(pageNumber);
  }
}
