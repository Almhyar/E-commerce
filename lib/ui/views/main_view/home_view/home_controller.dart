import 'package:get/get.dart';
import 'package:store/core/data/models/apis/category_model.dart';

import 'package:store/core/data/repositories/category_repository.dart';
import 'package:store/core/data/repositories/name_categories_repository.dart';
import 'package:store/core/enums/message_type.dart';
import 'package:store/core/services/base_controller.dart';
import 'package:store/ui/shared/custom_widgets/custom_toast.dart';

class HomeController extends BaseController {
  List<String> type = ["All", "electronics", "jewelery"];
  RxList<bool> selected = [false, true, false].obs;
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxList<String> categoryList1 = <String>[].obs;

  @override
  void onInit() {
    getCategory(cateegory: 'electronics');
    categoryList1.insert(0, "All");
    getNameCategories();

    super.onInit();
  }

  void changeCategory({required String category}) {
    categoryList.clear();

    getCategory(cateegory: category);
  }

  void getCategory({required String cateegory}) {
    if (cateegory == "electronics")
      runFutureFunction(
          function: CategoryRepository().getElectronics().then((value) {
        value.fold((l) {
          CustomToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          categoryList.addAll(r);
        });
      }));
    else if (cateegory == "jewelery")
      runFutureFunction(
          function: CategoryRepository().getJewelery().then((value) {
        value.fold((l) {
          CustomToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          categoryList.addAll(r);
        });
      }));
    else
      runFutureFunction(
          function: CategoryRepository().getAll().then((value) {
        value.fold((l) {
          CustomToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          categoryList.addAll(r);
        });
      }));
  }

  List<String> getNameCategories() {
    //categoryList1.clear();

    runFutureFunction(
        function: NameCategoriesRepository().getAll().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        categoryList1.addAll(r);
      });
    }));

    return categoryList1;
  }
}
