import 'package:get/get.dart';
import 'package:store/core/enums/bottom_navigation_enum.dart';
import 'package:store/core/services/base_controller.dart';

class BottomNavigationController extends BaseController {
  BottomNavigationController(BottomNavigationEnum type) {
    type1.value = type;
  }
  Rx<BottomNavigationEnum> type1 = BottomNavigationEnum.HOME.obs;
}
