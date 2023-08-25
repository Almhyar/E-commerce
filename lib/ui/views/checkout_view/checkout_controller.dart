import 'package:get/get.dart';
import 'package:store/core/services/base_controller.dart';
import 'package:store/ui/shared/utils.dart';
import 'package:store/ui/views/main_view/main_view.dart';

class CheckoutController extends BaseController {
  @override
  void onClose() {
    cartService.clearCart();
    Get.off(MainView());
    super.onClose();
  }
}
