import 'package:get/get.dart';
import 'package:store/core/data/models/apis/category_model.dart';
import 'package:store/core/services/base_controller.dart';
import 'package:store/ui/shared/utils.dart';
import 'package:store/ui/views/main_view/main_view.dart';

class ProductDetailsController extends BaseController {
  ProductDetailsController(CategoryModel categoryModel) {
    model = categoryModel;
  }

  CategoryModel model = CategoryModel();
  RxInt count = 1.obs;
  RxDouble rating = 0.0.obs;

  void changeCount(bool incress) {
    if (incress)
      count++;
    else {
      if (count > 1) count--;
    }
  }

  double calcTotal() {
    return (count.value * model.price!).toDouble();
  }

  void addToCart() {
    cartService.addToCart(
        model: model,
        count: count.value,
        afterAdd: () {
          Get.off(() => MainView());
        });
  }
}
